FROM ubuntu:latest

ENV PG_VERSION 9.5
#ENV PG_PASSWORD
ENV PG_BASE /var/lib/postgresql
ENV PG_PASSWORD_FILE ${PG_BASE}/pwfile
ENV PG_DATA ${PG_BASE}/${PG_VERSION}/main
ENV PG_CONFIG_DIR /etc/postgresql/${PG_VERSION}/main
ENV PG_CONFIG_FILE ${PG_CONFIG_DIR}/postgresql.conf
ENV PG_BINDIR /usr/lib/postgresql/${PG_VERSION}/bin



RUN apt-get update && apt-get upgrade -y \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_VERSION \
           postgresql-client-$PG_VERSION \
           postgresql-contrib-$PG_VERSION \
           postgresql-$PG_VERSION-plv8 \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && rm -rf /tmp/*
#COPY docker-entrypoint.sh /usr/local/bin/

# RUN rm -rf "$PG_BASE" && mkdir -p "$PG_BASE" \
RUN chown -R postgres:postgres "$PG_BASE" \
      && mkdir -p /var/run/postgresql/$PG_VERSION-main.pg_stat_tmp \
      && chown -R postgres:postgres /var/run/postgresql && chmod g+s /var/run/postgresql 
      #&& chmod +x /usr/local/bin/docker-entrypoint.sh

RUN echo "host all  all    0.0.0.0/0  md5" >> $PG_CONFIG_DIR/pg_hba.conf \
      && echo "host all  all    ::/0  md5" >> $PG_CONFIG_DIR/pg_hba.conf \
      && echo "listen_addresses='*'" >> $PG_CONFIG_FILE \
      #&& echo "docker postgres docker" >> $PG_CONFIG_DIR/pg_ident.conf

USER postgres

WORKDIR /PostgreSQL
ADD . /PostgreSQL

RUN -u postgres postgres /usr/lib/postgresql/9.5/bin/postgres -D $PG_DATA -c config_file=$PG_CONFIG_FILE & sleep 1 \
&& psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" \
&& createdb -O docker docker \
&& psql -U docker -f schema.sql -p 5432 docker

#ENV PATH $PATH:/usr/lib/postgresql/$PG_VERSION/bin
VOLUME ["${PG_BASE}"]

EXPOSE 5432

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]
