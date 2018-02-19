FROM postgres:latest
WORKDIR /PostgreSQL
ADD . /PostgreSQL

CMD ["psql -f schema.sql postgres"]
