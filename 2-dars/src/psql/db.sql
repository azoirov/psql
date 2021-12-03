CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    about TEXT,
    avatar TEXT,
    email VARCHAR(128),
    address VARCHAR,
    get_in_touch TEXT,
);

CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(32)
);

CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    title VARCHAR(64),
    text TEXT,
    icon VARCHAR(64)
);

CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    title VARCHAR(64),
    status INT
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(64),
    bio TEXT,
    avatar TEXT
);

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    email VARCHAR(128),
    subject VARCHAR(64),
    message TEXT
);
