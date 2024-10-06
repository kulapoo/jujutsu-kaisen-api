use sqlx::PgPool;

use crate::{character::Character, pagination::Pagination, repositories::characters as repository};

use crate::application::error::Error;
pub async fn list(
    pool: &PgPool,
    pagination: Pagination,
) -> Result<Vec<Character>, Error> {
    let res = repository::list(&pool, pagination).await
        .map(|characters| characters)
        .map_err(|err| {
            match err {
                sqlx::Error::RowNotFound => Error::NotFound,
                _ => Error::Unexpected(err.into()),
            }
        })?;
    Ok(res)
}
