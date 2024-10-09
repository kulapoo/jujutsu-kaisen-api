pub fn error_chain_fmt(
    e: &anyhow::Error,
    f: &mut std::fmt::Formatter<'_>,
) -> std::fmt::Result {
    writeln!(f, "{}\n", e)?;
    let mut current = e.source();
    while let Some(cause) = current {
        writeln!(f, "Caused by:\n\t{}", cause)?;
        current = cause.source();
    }
    Ok(())
}



#[derive(derive_more::From, derive_more::Error, derive_more::Display)]
#[display("{_variant}")]
pub enum Error {
    NotFound,
    #[from]
    Unexpected(anyhow::Error),
}

impl std::fmt::Debug for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Error::NotFound => self.to_string().fmt(f),
            Error::Unexpected(err) => error_chain_fmt(err, f),
        }
    }
}