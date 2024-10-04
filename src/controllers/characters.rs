use actix_web::HttpResponse;


pub async fn list() -> HttpResponse {
    HttpResponse::Ok().finish()
}