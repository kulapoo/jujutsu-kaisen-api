use jjk_api::configuration::{get_configuration, DatabaseSettings};
use jjk_api::pagination::Pagination;
use jjk_api::startup::{get_connection_pool, Application};
use jjk_api::telemetry::{get_subscriber, init_subscriber};
use once_cell::sync::Lazy;
use secrecy::SecretString;
use sqlx::{Connection, Executor, PgConnection, PgPool};
// use std::sync::LazyLock;
use uuid::Uuid;

static TRACING: Lazy<()> = Lazy::new(|| {
    let default_filter_level = "info".to_string();
    let subscriber_name = "test".to_string();
    if std::env::var("TEST_LOG").is_ok() {
        let subscriber = get_subscriber(subscriber_name, default_filter_level, std::io::stdout);
        init_subscriber(subscriber);
    } else {
        let subscriber = get_subscriber(subscriber_name, default_filter_level, std::io::sink);
        init_subscriber(subscriber);
    };
});


pub struct TestApp {
	pub address: String,
	pub port: u16,
	pub db_pool: PgPool,
	pub api_client: reqwest::Client,
}
impl TestApp {
	pub async fn get_characters(&self, pagination: Option<Pagination>) -> reqwest::Response {
        let (page, limit) = pagination.map_or((1, 10), |p| {
            (p.page.unwrap_or(1), p.limit.unwrap_or(10))
        });

		self.api_client
			.get(&format!("{}/characters?page={}&limit={}", &self.address, page, limit))
			.send()
			.await
			.expect("Failed to execute request.")
	}

    pub async fn get_character_by_id(&self, id: Uuid) -> reqwest::Response {
        self.api_client
            .get(&format!("{}/characters/{}", &self.address, id))
            .send()
            .await
            .expect("Failed to execute request.")
    }

    pub async fn get_episodes(&self, pagination: Option<Pagination>) -> reqwest::Response {
        let (page, limit) = pagination.map_or((1, 10), |p| {
            (p.page.unwrap_or(1), p.limit.unwrap_or(10))
        });

        self.api_client
            .get(&format!("{}/episodes?page={}&limit={}", &self.address, page, limit))
            .send()
            .await
            .expect("Failed to execute request.")
    }

    pub async fn get_episode_by_id(&self, id: Uuid) -> reqwest::Response {
        self.api_client
            .get(&format!("{}/episodes/{}", &self.address, id))
            .send()
            .await
            .expect("Failed to execute request.")
    }
}

pub async fn spawn_app() -> TestApp {
    Lazy::force(&TRACING);

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
