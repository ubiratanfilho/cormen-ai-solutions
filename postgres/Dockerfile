FROM postgres:latest

ENV POSTGRES_USER cormen
ENV POSTGRES_PASSWORD cormen
ENV POSTGRES_DB cormen

COPY ./data/create.sql /docker-entrypoint-initdb.d/