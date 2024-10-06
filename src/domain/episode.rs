use sqlx::FromRow;
use serde::{Deserialize, Serialize};
use chrono::NaiveDate;
use uuid::Uuid;

#[derive(Debug, FromRow, Serialize, Deserialize)]
pub struct Episode {
    pub id: Uuid,
    pub name: String,
    pub air_date: Option<NaiveDate>,
    pub episode_code: Option<String>,
    pub created_at: chrono::NaiveDateTime,
}
