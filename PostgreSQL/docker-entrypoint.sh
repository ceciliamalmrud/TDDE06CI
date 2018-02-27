#!/usr/bin/env bash
exec ${PG_BINDIR}/postgres -D ${PG_DATA} -c config_file=${PG_CONFIG_FILE}
