include .env
include secrets/.env

run: # main entry for on server, can be run on desktop also
	docker-compose build --pull
	docker-compose up --remove-orphans --force-recreate -d

backup-dump: # copy everything you want to backup into ${DUMP_LOCATION}
	docker-compose exec postgis pg_dumpall -h localhost -U ${POSTGRES_USER} | gzip > ${DUMP_LOCATION}/dump.sql.gz

restore-dump:
	gunzip ${DUMP_LOCATION}/dump.sql | docker-compose exec -T postgis psql -h localhost -U ${POSTGRES_USER}
