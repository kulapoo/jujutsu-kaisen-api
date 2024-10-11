use jjk_api::{configuration::get_configuration, startup::Application, telemetry::{get_subscriber, init_subscriber}};
use tokio::task::JoinError;
use std::fmt::{Debug, Display};
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
	let subscriber = get_subscriber("jjk".into(), "info".into(), std::io::stdout);
	init_subscriber(subscriber);

	let configuration = get_configuration().expect("Failed to read configuration.");
	let application = Application::build(configuration.clone()).await?;
	let application_task = tokio::spawn(application.run_until_stopped());

    match application_task.await {
        Ok(result) => report_exit("API", Ok(result)),
        Err(e) => report_exit("API", Ok(Err(e))),
    }
	Ok(())
}


fn report_exit(task_name: &str, outcome: Result<Result<(), impl Debug + Display>, JoinError>) {
    match outcome {
        Ok(Ok(())) => {
            tracing::info!("{} has exited", task_name)
        }
        Ok(Err(e)) => {
            tracing::error!(
            error.cause_chain = ?e,
            error.message = %e,
            "{} failed",
            task_name
            )
        }
        Err(e) => {
            tracing::error!(
            error.cause_chain = ?e,
            error.message = %e,
            "{}' task failed to complete",
            task_name
            )
        }
    }
}