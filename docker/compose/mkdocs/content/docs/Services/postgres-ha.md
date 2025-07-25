---
tags:
  - relational
  - key-value
---
# PostgreSQL (High-Availability)

[:fontawesome-solid-globe: Project Homepage](https://www.postgresql.org/)

[:simple-git: Repository](https://git.postgresql.org/gitweb/?p=postgresql.git)

[:simple-docker: Container Registry](https://hub.docker.com/_/postgres)

[:material-database: DBDB.io](https://dbdb.io/db/postgresql)

A powerful, open source object-relational database system with over 35 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

This high-availability 3-node cluster is exposed on port 5432 and uses HA-Proxy to manage traffic and zookeeper to determine the leader.

HAProxy stats are viewable via port 7000 - for some reason this doesn't work behind Traefik and times out.

## GUI

- [DbGate](../dbgate)
- [pgAdmin](../pgadmin)
- [pgweb](../pgweb)
- [PuppyGraph](../puppygraph)

## Images
| Image | Tag |
| --- | --- |
| haproxy | 3.1.1-alpine3.20 |
| jamesdkelly88/postgres-patroni | 17.5 |
| zookeeper | 3.9.3 |

## Ports
- 5433

## Links
- [http://pg-proxy.jkdb.duckdns.org](http://pg-proxy.jkdb.duckdns.org)

