use sqlx::FromRow;
use serde::{Deserialize, Serialize};
use chrono::NaiveDateTime;

#[derive(Debug, FromRow, Serialize, Deserialize)]
pub struct Location {
    pub id: i32,
    pub name: String,
    pub kind: Option<String>,
    pub dimension: Option<String>,
    pub created_at: NaiveDateTime,
}
