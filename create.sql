-- Active: 1693593893050@@127.0.0.1@5432@cormenai

CREATE TABLE IF NOT EXISTS login (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS noticias (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    thumbnail VARCHAR(255) NOT NULL
);

INSERT INTO login (username, password, email) VALUES ('admin', 'admin', 'admin');
INSERT INTO noticias (title, content, thumbnail) VALUES ('Notícia 1', 'Conteúdo da notícia 1', 'https://picsum.photos/200/300');