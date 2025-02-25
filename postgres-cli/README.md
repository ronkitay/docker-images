# postgres-cli

A Docker image with the PG CLI.

Can be used to connect to an arbitrary PG instance or run queries on it.

## Building

```bash
./build.sh
```

## Running

### Interactive

```bash
docker run \
      --env WORKSPACE_NAME="<Workspace Name>" \
      --env PG_PASSWORD="<PASSWORD>" \
      --env PG_HOSTNAME="<HOSTNAME>" \
      --env PG_PORT="<PORT>" \
      --env PG_DB="<DB_NAME>" \
      --env PG_SCHEMA="<SCHEMA>" \
      --env PG_USERNAME="<USER_NAME>" \
      -t -i --rm postgres-cli:2.0.0
```

### Run single query

```bash
cp some_file.sql ${WORKSPACE}/query.sql

docker run \
      -v ${WORKSPACE}:/query/ \
      --env WORKSPACE_NAME="<Workspace Name>" \
      --env PG_PASSWORD="<PASSWORD>" \
      --env PG_HOSTNAME="<HOSTNAME>" \
      --env PG_PORT="<PORT>" \
      --env PG_DB="<DB_NAME>" \
      --env PG_SCHEMA="<SCHEMA>" \
      --env PG_USERNAME="<USER_NAME>" \
      --env FILE_NAME=/query/query.sql \
      -t -i --rm postgres-cli:2.0.0
```
