use jujutsu_kaisen_api::startup;
use std::net::TcpListener;

#[tokio::main]
async fn main() -> std::io::Result<()> {
    let address = TcpListener::bind("127.0.0.1:8000")?;
    startup::run(address)?.await
}
