use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use uuid::Uuid;


use crate::{application, pagination::Pagination};

use crate::controllers::error::{e400, e500};

pub async fn list(
    pool: web::Data<PgPool>,
    web::Query(pagination): web::Query<Pagination>,
) -> Result<HttpResponse, actix_web::Error> {

    application::characters::list(&pool, pagination)
        .await
        .map(|characters| HttpResponse::Ok().json(characters))
        .map_err(|error| match error {
            application::error::Error::NotFound => e400(error),
            application::error::Error::Unexpected(_) => e500(error),
        })
}

pub async fn find_by_id(
    pool: web::Data<PgPool>,
    id: web::Path<Uuid>,
) -> Result<HttpResponse, actix_web::Error> {
    let id = id.into_inner();

    application::characters::find_by_id(&pool, id)
        .await
        .map(|character| {
            character
                .map(|character| HttpResponse::Ok().json(character))
                .unwrap_or_else(|| HttpResponse::NotFound().finish())
        })
        .map_err(|error| match error {
            application::error::Error::NotFound => e400(error),
            application::error::Error::Unexpected(_) => e500(error),
        })
}