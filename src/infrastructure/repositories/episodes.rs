use sqlx::PgPool;

use crate::{episode::Episode, pagination::Pagination};



pub async fn list(pool: &PgPool, pagination: Pagination) -> Result<Vec<Episode>, sqlx::Error> {
    let page = pagination.page.unwrap_or(Pagination::DEFAULT_PAGE);
    let limit = pagination.limit.unwrap_or(Pagination::DEFAULT_LIMIT);
    let offset = (page - 1) * limit;

    let rows = sqlx::query_as::<_, Episode>(
        r#"
        SELECT id, name, air_date, episode_code, created_at
        FROM episodes
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

pub async fn find_by_id(pool: &PgPool, id: uuid::Uuid) -> Result<Option<Episode>, sqlx::Error> {
    let row = sqlx::query_as::<_, Episode>(
        r#"
        SELECT id, name, air_date, episode_code, created_at
        FROM episodes
        WHERE id = $1
        "#
    )
    .bind(id)
    .fetch_optional(pool)
    .await?;

    Ok(row)
}