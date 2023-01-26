include .env
UID := $(shell id -u)
GID := $(shell id -g)

generate-selfsigned-cert: # uid and gid have to be postgres=999
	cd cert && OWNER="${UID}.${GID}" docker-compose up --remove-orphans

run: # main entry for on server, can be run on desktop also
	docker-compose build --pull
	docker-compose up --remove-orphans --force-recreate -d

backup-dump: # copy everything you want to backup into ${DUMP_LOCATION}
	docker-compose exec postgis pg_dumpall -h localhost -U ${POSTGRES_USER} | gzip > ${DUMP_LOCATION}/dump.sql.gz

restore-dump:
	echo "DROP DATABASE ${POSTGRES_DB} WITH (FORCE);" | docker-compose exec -T postgis psql -h localhost -U ${POSTGRES_USER} -d postgres
	gunzip -c ${DUMP_LOCATION}/dump.sql.gz | docker-compose exec -T postgis psql -h localhost -U ${POSTGRES_USER} -d postgres

psql:
	docker-compose exec postgis psql -h localhost -U ${POSTGRES_USER} -d ${POSTGRES_DB}

delete-all:
	docker-compose down --remove-orphans
	docker volume rm -f tempaqua_app_database
