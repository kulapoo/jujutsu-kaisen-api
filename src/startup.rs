use actix_web::dev::Server;
use actix_web::web::Data;
use actix_web::{web, App, HttpServer};
use secrecy::SecretString;
use sqlx::postgres::PgPoolOptions;
use sqlx::PgPool;
use std::net::TcpListener;

use crate::configuration::{DatabaseSettings, Settings};
use crate::controllers::{characters, health_check};
pub struct Application {
	port: u16,
	server: Server,
}

impl Application {
	pub async fn build(configuration: Settings) -> Result<Self, Box<dyn std::error::Error>> {
		let connection_pool = get_connection_pool(&configuration.database);

		let address = format!("{}:{}", configuration.application.host, configuration.application.port);
		let listener = TcpListener::bind(address)?;
		let port = listener.local_addr().unwrap().port();
		let server = run(
			listener,
			connection_pool,
			configuration.application.base_url,
			configuration.application.hmac_secret,
		)
		.await?;

		Ok(Self { port, server })
	}

	pub fn port(&self) -> u16 {
		self.port
	}

	pub async fn run_until_stopped(self) -> Result<(), std::io::Error> {
		self.server.await
	}
}

pub fn get_connection_pool(configuration: &DatabaseSettings) -> PgPool {
	PgPoolOptions::new().connect_lazy_with(configuration.connect_options())
}

pub struct ApplicationBaseUrl(pub String);

async fn run(
	listener: TcpListener,
	db_pool: PgPool,
	base_url: String,
	hmac_secret: SecretString,
) -> Result<Server, Box<dyn std::error::Error>> {
	let db_pool = Data::new(db_pool);
	let base_url = Data::new(ApplicationBaseUrl(base_url));
	let server = HttpServer::new(move || {
		App::new()
			// .wrap(message_framework.clone())
			// .wrap(TracingLogger::default())
			.route("/health-check", web::get().to(health_check))
			.route("/characters", web::get().to(characters::list))
			.app_data(db_pool.clone())
			.app_data(base_url.clone())
			.app_data(Data::new(HmacSecret(hmac_secret.clone())))
	})
	.listen(listener)?
	.run();
	Ok(server)
}

#[derive(Clone)]
pub struct HmacSecret(pub SecretString);
