#!/bin/bash

rustup component add rustfmt
rustup component add clippy
cargo install cargo-watch
cargo install sqlx-cli --no-default-features --features rustls,postgres
