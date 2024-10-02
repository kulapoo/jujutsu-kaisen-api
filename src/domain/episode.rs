use sqlx::FromRow;
use serde::{Deserialize, Serialize};
use chrono::NaiveDate;

#[derive(Debug, FromRow, Serialize, Deserialize)]
pub struct Episode {
    pub id: i32,
    pub name: String,
    pub air_date: Option<NaiveDate>,
    pub episode_code: Option<String>,
    pub created_at: chrono::NaiveDateTime,
}
