use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use uuid::Uuid;


use crate::{repositories, pagination::Pagination};
use super::error::response_error;




#[tracing::instrument(
    name = "List all characters",
    skip(pool)
)]
pub async fn list(
    pool: web::Data<PgPool>,
    web::Query(pagination): web::Query<Pagination>,
) -> Result<HttpResponse, actix_web::Error> {

    repositories::characters::list(&pool, pagination)
        .await
        .map(|characters| HttpResponse::Ok().json(characters))
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

    repositories::characters::find_by_id(&pool, id)
        .await
        .map(|character| {
            character
                .map(|character| HttpResponse::Ok().json(character))
                .unwrap_or_else(|| HttpResponse::NotFound().finish())
        })
        .map_err(response_error)
}

#[tracing::instrument(
    name = "List all character episodes",
    skip(pool)
)]
pub async fn list_episodes(
    pool: web::Data<PgPool>,
    id: web::Path<Uuid>,
) -> Result<HttpResponse, actix_web::Error> {

    repositories::characters::list_character_episodes(&pool, id.into_inner())
        .await
        .map(|character_episodes| HttpResponse::Ok().json(character_episodes))
        .map_err(response_error)
}

#[tracing::instrument(
    name = "List all character locations",
    skip(pool)
)]
pub async fn list_locations(
    pool: web::Data<PgPool>,
    id: web::Path<Uuid>,
) -> Result<HttpResponse, actix_web::Error> {

    repositories::characters::list_character_locations(&pool, id.into_inner())
        .await
        .map(|character_locations| HttpResponse::Ok().json(character_locations))
        .map_err(response_error)
}
