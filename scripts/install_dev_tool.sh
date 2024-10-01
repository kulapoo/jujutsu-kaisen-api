#!/bin/bash

cargo install cargo-watch

rustup component add rustfmt

rustup component add clippy

cargo install sqlx-cli --no-default-features --features postgres,rustls

cargo install cargo-audit

cargo install cargo-tarpaulin

if command -v pip3 &> /dev/null
then
    pip3 install pre-commit
    pre-commit install
else
    echo "pip3 could not be found, please install pip3 first. For more info -> https://pre-commit.com/ "
fi
