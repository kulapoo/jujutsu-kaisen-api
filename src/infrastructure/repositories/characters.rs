// list all characters with pagination
// using query parameters `page` and `limit`
// with sqlx

use sqlx::PgPool;

use crate::{character::Character, pagination::Pagination};

#[tracing::instrument(
    name = "Get list of characters from the database",
    skip(pool)
)]
pub async fn list(pool: &PgPool, pagination: Pagination) -> Result<Vec<Character>, sqlx::Error> {
    let page = pagination.page.unwrap_or(Pagination::DEFAULT_PAGE);
    let limit = pagination.limit.unwrap_or(Pagination::DEFAULT_LIMIT);
    let offset = (page - 1) * limit;

    let rows = sqlx::query_as::<_, Character>(
        r#"
        SELECT id, name, status, species, kind, gender, image_url, created_at
        FROM characters
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
pub async fn find_by_id(pool: &PgPool, id: uuid::Uuid) -> Result<Option<Character>, sqlx::Error> {
    let row = sqlx::query_as::<_, Character>(
        r#"
        SELECT id, name, status, species, kind, gender, image_url, created_at
        FROM characters
        WHERE id = $1
        "#
    )
    .bind(id)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}
