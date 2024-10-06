mod controllers;
mod application;
mod domain;
mod infrastructure;
mod core;

pub mod configuration;
pub mod error;
pub mod startup;

use error::Error;

pub use infrastructure::*;

pub use core::pagination;

pub use domain::*;
pub use controllers::*;
pub use application::*;

pub type Result<T> = std::result::Result<T, Error>;
