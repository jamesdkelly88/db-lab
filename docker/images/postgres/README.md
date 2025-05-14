# Postgresql 18 Docker Image

There isn't an official image for v18 yet (still in beta)

## Process

- Copy `Dockerfile` and scripts from [v17](https://github.com/docker-library/postgres/tree/master/17/bookworm)
- Run a Debian container and execute the following to get the package version for PG_VERSION:
```sh
export PG_MAJOR=18
export aptRepo="[ signed-by=/usr/local/share/keyrings/postgres.gpg.asc ] http://apt.postgresql.org/pub/repos/apt/ bookworm-pgdg main $PG_MAJOR";
echo "deb $aptRepo" > /etc/apt/sources.list.d/pgdg.list
apt update
apt list -a postgresql-$PG_MAJOR | grep pgdg
```
- Update `docker-entrypoint.sh` to replace any references to v17 with v18
- Update `Dockerfile`

    - after `FROM debian:bookworm-slim`: 
        ```dockerfile
        # add experimental packages
        COPY experimental.sources /etc/apt/sources.list.d/experimental.sources
        ```
    - replace `ENV PG_MAJOR 17`: 
        ```dockerfile
        ENV PG_MAJOR 18
        ```
    - replace `ENV PG_VERSION 17.5-1.pgdg120+1`:
        ```
        ENV PG_VERSION 18~beta1-1.pgdg120+1
        ```
- Update `tag` with the version
- Run `docker login`
- Run `task build`