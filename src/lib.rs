mod controllers;

mod domain;
mod infrastructure;
mod core;

pub mod configuration;
pub mod startup;
pub mod telemetry;

pub use core::error::Error;

pub use infrastructure::*;

pub use core::pagination;

pub use domain::*;
pub use controllers::*;

pub type Result<T> = std::result::Result<T, Error>;
