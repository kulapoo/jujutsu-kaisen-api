CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(100) NOT NULL,
    species VARCHAR(100),
    kind VARCHAR(100),
    gender VARCHAR(100),
    origin_location_id INTEGER REFERENCES locations(id),
    current_location_id INTEGER REFERENCES locations(id),
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
