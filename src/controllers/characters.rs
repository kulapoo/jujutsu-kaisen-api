use actix_web::{web, HttpResponse};
use sqlx::PgPool;


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
