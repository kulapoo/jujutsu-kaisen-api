use actix_web::{web, App, HttpServer, Responder};
use jujutsu_kaisen_api::controllers::health_check;

async fn greet() -> impl Responder {
    format!("Welcome to the Jujutsu Kaisen API!")
}

#[tokio::main]  // Use Tokio as the async runtime
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(greet))
            .route("/health-check", web::get().to(health_check))
    })
    .bind("127.0.0.1:8000")?
    .run()
    .await
}
