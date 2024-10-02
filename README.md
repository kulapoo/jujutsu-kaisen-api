# Jujutsu Kaisen API Project

## Prerequisites

Make sure you have the following installed:

- **Rust** (via rustup):
  ```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

**Python** (for pre-commit):
```bash
# Linux
sudo apt-get install python3-pip
# macOS
brew install python
```

## General Dependencies

These are the main libraries used in the project for functionality:

- **Actix**: Web framework for building HTTP servers in Rust.
- **SQLx**: PostgreSQL ORM for database interaction.
- **Tokio**: Asynchronous runtime for handling async tasks in Rust.

# Development Tools

You can install all the required development tools by running the provided install_dev_tools.sh script.

```bash
./scripts/install_dev_tools.sh
```
## Dev tools list
- [cargo-watch](https://crates.io/crates/cargo-watch)
- [rustfmt](https://github.com/rust-lang/rustfmt)
- [clippy](https://github.com/rust-lang/rust-clippy)
- [sqlx-cli](https://crates.io/crates/sqlx-cli)
- [cargo-audit](https://crates.io/crates/cargo-audit)
- [cargo-tarpaulin](https://crates.io/crates/cargo-tarpaulin)
- [pre-commit](https://pre-commit.com/)


# Development

## Setup

- Install the required dev dependencies by running the `install_dev_tools.sh` script:
```bash
./scripts/install_dev_tools.sh
```

- create a `.env` file in the root of the project and add the following:
```bash
DATABASE_URL=postgres://postgres:password@localhost/jjk
```

- Initialize the database by running the `init_db.sh` script:
```bash
./scripts/init_db.sh
```


## Running the server

- Run the server using the following command:
```bash
cargo run
```


## SQL commands


### connect to postgres
```bash
psql -h localhost -p 5432 -U postgres -d jjk
```
