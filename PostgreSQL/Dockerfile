FROM postgres:latest
WORKDIR /PostgreSQL
ADD . /PostgreSQL

CMD ["psql", "-f", "schema.sql","-h","127.0.0.1","postgres"]
