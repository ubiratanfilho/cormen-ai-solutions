-- Active: 1685994269356@@127.0.0.1@5432@cormenai@public
-- Criação das tabelas
CREATE TABLE IF NOT EXISTS login (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS noticias (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    thumbnail VARCHAR(255) NOT NULL
);

-- Select padrão
SELECT * FROM login;
SELECT * FROM noticias;