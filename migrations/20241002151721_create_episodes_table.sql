CREATE TABLE episodes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    air_date DATE,
    episode_code VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
