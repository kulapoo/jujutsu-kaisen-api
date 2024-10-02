use sqlx::FromRow;
use serde::{Deserialize, Serialize};
use chrono::NaiveDateTime;

#[derive(Debug, FromRow, Serialize, Deserialize)]
pub struct Character {
    pub id: i32,
    pub name: String,
    pub status: String,
    pub species: Option<String>,
    pub kind: Option<String>,
    pub gender: Option<String>,
    pub origin_location_id: Option<i32>,
    pub current_location_id: Option<i32>,
    pub image_url: Option<String>,
    pub created_at: NaiveDateTime,
}
