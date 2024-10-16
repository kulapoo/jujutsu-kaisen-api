use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use uuid::Uuid;


use crate::{repositories, pagination::Pagination};
use super::error::response_error;


#[tracing::instrument(
    name = "List all locations",
    skip(pool)
)]
pub async fn list(
    pool: web::Data<PgPool>,
    web::Query(pagination): web::Query<Pagination>,
) -> Result<HttpResponse, actix_web::Error> {

    repositories::locations::list(&pool, pagination)
        .await
        .map(|locations| HttpResponse::Ok().json(locations))
        .map_err(response_error)
}


#[tracing::instrument(
    name = "Get a location by id",
    skip(pool)
)]
pub async fn find_by_id(
    pool: web::Data<PgPool>,
    id: web::Path<Uuid>,
) -> Result<HttpResponse, actix_web::Error> {

    let id = id.into_inner();

    repositories::locations::find_by_id(&pool, id)
        .await
        .map(|location| {
            location
                .map(|location| HttpResponse::Ok().json(location))
                .unwrap_or_else(|| HttpResponse::NotFound().finish())
        })
        .map_err(response_error)
}