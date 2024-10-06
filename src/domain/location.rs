use sqlx::FromRow;
use serde::{Deserialize, Serialize};
use chrono::NaiveDateTime;
use uuid::Uuid;

#[derive(Debug, FromRow, Serialize, Deserialize)]
pub struct Location {
    pub id: Uuid,
    pub name: String,
    pub kind: Option<String>,
    pub dimension: Option<String>,
    pub created_at: NaiveDateTime,
}
