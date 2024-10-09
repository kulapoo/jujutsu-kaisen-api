use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use uuid::Uuid;


use crate::{repositories, pagination::Pagination};
use super::error::response_error;

pub async fn list(
    pool: web::Data<PgPool>,
    web::Query(pagination): web::Query<Pagination>,
) -> Result<HttpResponse, actix_web::Error> {
    // todo: add logging
    repositories::characters::list(&pool, pagination)
        .await
        .map(|characters| HttpResponse::Ok().json(characters))
        .map_err(response_error)
}

pub async fn find_by_id(
    pool: web::Data<PgPool>,
    id: web::Path<Uuid>,
) -> Result<HttpResponse, actix_web::Error> {

    let id = id.into_inner();

    repositories::characters::find_by_id(&pool, id)
        .await
        .map(|character| {
            character
                .map(|character| HttpResponse::Ok().json(character))
                .unwrap_or_else(|| HttpResponse::NotFound().finish())
        })
        .map_err(response_error)
}