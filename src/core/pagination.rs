use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Pagination {
    pub page: Option<i64>,
    pub limit: Option<i64>,
}

impl Pagination {
    pub const DEFAULT_LIMIT: i64 = 10;
    pub const DEFAULT_PAGE: i64 = 1;
}