use actix_web::{http::header::LOCATION, HttpResponse};

// Return an opaque 500 while preserving the error root's cause for logging.
pub fn e500<T>(e: T) -> actix_web::Error
where
    T: std::fmt::Debug + std::fmt::Display + 'static,
{
    println!("500: {:#?}", e);
    actix_web::error::ErrorInternalServerError(e)
}

pub fn see_other(location: &str) -> HttpResponse {
    HttpResponse::SeeOther()
        .insert_header((LOCATION, location))
        .finish()
}

// Return a 400 with the user-representation of the validation error as body.
// The error root cause is preserved for logging purposes.
pub fn e400<T>(e: T) -> actix_web::Error
where
    T: std::fmt::Debug + std::fmt::Display + 'static,
{
    println!("400: {:#?}", e);
    actix_web::error::ErrorBadRequest(e)
}


pub fn response_error(e: sqlx::Error) -> actix_web::Error{
    match e {
        sqlx::Error::RowNotFound => e400(e),
        _ => e500(e),
    }
}