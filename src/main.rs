use jjk_api::{configuration::get_configuration, startup::Application};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // let subscriber = get_subscriber("zero2prod".into(), "info".into(), std::io::stdout);
    // init_subscriber(subscriber);

    let configuration = get_configuration().expect("Failed to read configuration.");
    let application = Application::build(configuration.clone()).await?;
    let application_task = tokio::spawn(application.run_until_stopped());
    // let worker_task = tokio::spawn(run_worker_until_stopped(configuration));

    // tokio::select! {
    //     o = application_task => report_exit("API", o),
    //     o = worker_task =>  report_exit("Background worker", o),
    // };

    Ok(())
}
