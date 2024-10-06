use jjk_api::configuration::{get_configuration, DatabaseSettings};
use jjk_api::startup::{get_connection_pool, Application};
use secrecy::SecretString;
use sqlx::{Connection, Executor, PgConnection, PgPool};
// use std::sync::LazyLock;
use uuid::Uuid;

pub struct TestApp {
	pub address: String,
	pub port: u16,
	pub db_pool: PgPool,
	pub api_client: reqwest::Client,
}
impl TestApp {
	pub async fn get_characters(&self) -> reqwest::Response {
		self.api_client
			.get(&format!("{}/characters?page=1&limit=10", &self.address))
			.send()
			.await
			.expect("Failed to execute request.")
	}
}

pub async fn spawn_app() -> TestApp {
	let configuration = {
		let mut c = get_configuration().expect("Failed to read configuration.");
		// Use a different database for each test case
		c.database.database_name = Uuid::new_v4().to_string();
		// Use a random OS port
		c.application.port = 0;
		// Use the mock server as email API
		c
	};

	// Create and migrate the database
	configure_database(&configuration.database).await;

	// Launch the application as a background task
	let application = Application::build(configuration.clone())
		.await
		.expect("Failed to build application.");
	let application_port = application.port();
	let _ = tokio::spawn(application.run_until_stopped());

	let client = reqwest::Client::builder()
		.redirect(reqwest::redirect::Policy::none())
		.cookie_store(true)
		.build()
		.unwrap();

	let test_app = TestApp {
		address: format!("http://localhost:{}", application_port),
		port: application_port,
		db_pool: get_connection_pool(&configuration.database),
		api_client: client,
	};

	test_app
}

async fn configure_database(config: &DatabaseSettings) -> PgPool {
	// Create database
	let maintenance_settings = DatabaseSettings {
		database_name: "postgres".to_string(),
		username: "postgres".to_string(),
		password: SecretString::new("password".to_string().into_boxed_str()),
		..config.clone()
	};
	let mut connection = PgConnection::connect_with(&maintenance_settings.connect_options())
		.await
		.expect("Failed to connect to Postgres");
	connection
		.execute(format!(r#"CREATE DATABASE "{}";"#, config.database_name).as_str())
		.await
		.expect("Failed to create database.");

	// Migrate database
	let connection_pool = PgPool::connect_with(config.connect_options())
		.await
		.expect("Failed to connect to Postgres.");
	sqlx::migrate!("./migrations")
		.run(&connection_pool)
		.await
		.expect("Failed to migrate the database");
	connection_pool
}
