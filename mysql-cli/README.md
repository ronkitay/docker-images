# postgres-cli

A Docker image with the MySQL CLI.

Can be used to connect to an arbitrary MySQL instance or run queries on it.

## Building

```bash
./build.sh
```

## Running

### Interactive

```bash
docker run \
      --env WORKSPACE_NAME="<Workspace Name>" \
      --env MYSQL_PASSWORD="<PASSWORD>" \
      --env MYSQL_HOSTNAME="<HOSTNAME>" \
      --env MYSQL_PORT="<PORT>" \
      --env MYSQL_DB="<DB_NAME>" \
      --env MYSQL_USERNAME="<USER_NAME>" \
      -t -i --rm postgres-cli:2.0.0
```

### Run single query

```bash
cp some_file.sql ${WORKSPACE}/query.sql

docker run \
      -v ${WORKSPACE}:/query/ \
      --env WORKSPACE_NAME="<Workspace Name>" \
      --env MYSQL_PASSWORD="<PASSWORD>" \
      --env MYSQL_HOSTNAME="<HOSTNAME>" \
      --env MYSQL_PORT="<PORT>" \
      --env MYSQL_DB="<DB_NAME>" \
      --env MYSQL_USERNAME="<USER_NAME>" \
      --env FILE_NAME=/query/query.sql \
      -t -i --rm postgres-cli:2.0.0
```
