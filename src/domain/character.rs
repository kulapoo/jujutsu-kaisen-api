use sqlx::FromRow;
use serde::{Deserialize, Serialize};
use chrono::NaiveDateTime;
use uuid::Uuid;

#[derive(Debug, FromRow, Serialize, Deserialize)]
pub struct Character {
    pub id: Uuid,
    pub name: String,
    pub status: String,
    pub species: Option<String>,
    pub kind: Option<String>,
    pub gender: Option<String>,
    pub image_url: Option<String>,
    pub created_at: NaiveDateTime,
}
