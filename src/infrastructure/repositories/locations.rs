// list all characters with pagination
// using query parameters `page` and `limit`
// with sqlx


use sqlx::PgPool;

use crate::{location::Location, pagination::Pagination};

#[tracing::instrument(
    name = "Get list of locations from the database",
    skip(pool)
)]
pub async fn list(pool: &PgPool, pagination: Pagination) -> Result<Vec<Location>, sqlx::Error> {
    let page = pagination.page.unwrap_or(Pagination::DEFAULT_PAGE);
    let limit = pagination.limit.unwrap_or(Pagination::DEFAULT_LIMIT);
    let offset = (page - 1) * limit;

    let rows = sqlx::query_as::<_, Location>(
        r#"
        SELECT id, name, kind, dimension, created_at
        FROM locations
        ORDER BY created_at DESC  -- Sort by `created_at` in descending order
        LIMIT $1 OFFSET $2
        "#
    )
    .bind(limit)
    .bind(offset)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}


#[tracing::instrument(
    name = "Get a character from the database",
    skip(pool)
)]
pub async fn find_by_id(pool: &PgPool, id: uuid::Uuid) -> Result<Option<Location>, sqlx::Error> {
    let row = sqlx::query_as::<_, Location>(
        r#"
        SELECT id, name, kind, dimension, created_at
        FROM locations
        WHERE id = $1
        "#
    )
    .bind(id)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}
