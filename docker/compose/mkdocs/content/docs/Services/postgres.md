# PostgreSQL

A powerful, open source object-relational database system with over 35 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance. 

[:fontawesome-solid-globe: Project Homepage](https://www.postgresql.org/)

[:simple-git: Repository](https://git.postgresql.org/gitweb/?p=postgresql.git)

[:simple-docker: Container Registry](https://hub.docker.com/_/postgres)

## Requirements

PostgreSQL tools are required on your machine to connect to Postgres and run the `backup` and `sample` tasks.

pgAdmin is provided in this lab as a web interface for PostgreSQL. This comes pre-configured with connections to all included versions.

There are always 5 supported versions of PostgreSQL (plus a 2 month grace period for the oldest when a new one is released). Each version is exposed on port `5432X`, where `X` is the last digit of the major version number: e.g PostgreSQL 16 uses port `54326`.

A high-availability PostgreSQL cluster is exposed on the default port `5432`, consisting of:

- HAProxy
- 3x PostgreSQL instances
- Zookeeper

HAProxy stats are viewable via port `7000` - for some reason this doesn't work behind Traefik and times out.