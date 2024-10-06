// list all characters with pagination
// using query parameters `page` and `limit`
// with sqlx

use sqlx::PgPool;

use crate::{character::Character, pagination::Pagination};

pub async fn list(pool: &PgPool, pagination: Pagination) -> Result<Vec<Character>, sqlx::Error> {
    let offset = (pagination.page - 1) * pagination.limit;

    let rows = sqlx::query_as::<_, Character>(
        r#"
        SELECT id, name, status, species, kind, gender, image_url, created_at
        FROM characters
        ORDER BY created_at DESC  -- Sort by `created_at` in descending order
        LIMIT $1 OFFSET $2
        "#
    )
    .bind(pagination.limit)
    .bind(offset)
    .fetch_all(pool)
    .await?;

    Ok(rows)
}