use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use uuid::Uuid;


use crate::{repositories, pagination::Pagination};
use super::error::response_error;


#[tracing::instrument(
    name = "List all episodes",
    skip(pool)
)]
pub async fn list(
    pool: web::Data<PgPool>,
    web::Query(pagination): web::Query<Pagination>,
) -> Result<HttpResponse, actix_web::Error> {

    repositories::episodes::list(&pool, pagination)
        .await
        .map(|episodes| HttpResponse::Ok().json(episodes))
        .map_err(response_error)
}

#[tracing::instrument(
    name = "Get a character by id",
    skip(pool)
)]
pub async fn find_by_id(
    pool: web::Data<PgPool>,
    id: web::Path<Uuid>,
) -> Result<HttpResponse, actix_web::Error> {

    let id = id.into_inner();

    repositories::episodes::find_by_id(&pool, id)
        .await
        .map(|episode| {
            episode
                .map(|episode| HttpResponse::Ok().json(episode))
                .unwrap_or_else(|| HttpResponse::NotFound().finish())
        })
        .map_err(response_error)
}