## Missing extensions (based on v17 RDS)
- [ ] auto_explain
- [x] bool_plperl
- [ ] flow_control
- [x] hll
- [x] hstore_plperl
- [x] hypopg
- [x] ICU module
- [x] ip4r
- [x] jsonb_plperl
- [ ] log_fdw
- [x] mysql_fdw
- [ ] old_snapshot
- [x] orafce
- [ ] pg_bigm
- [x] pg_hint_plan
- [x] pg_partman
- [ ] pg_proctab
- [x] pg_repack
- [x] pg_similarity
- [ ] pg_tle [build from source](https://github.com/aws/pg_tle/blob/main/docs/01_install.md)
- [ ] ~~pg_transport (rds only)~~
- [ ] ~~pgactive (rds only)~~
- [x] pglogical
- [ ] pgrouting
- [ ] pgTAP
- [x] plperl
- [x] plprofiler
- [ ] plrust [build deps](https://plrust.io/install-plrust-on-debian-ubuntu.html)
- [ ] pltcl
- [ ] plv8
- [ ] prefix
- [ ] rdkit
- [x] wal2json

## Extensions to try
- [ ] pg-permissions
- [ ] pgmemcache
- [x] pgtt

```
pgagent - job scheduling engine for PostgreSQL
postgresql-17 - The World's Most Advanced Open Source Relational Database
postgresql-17-age - Graph database optimized for fast analysis and real-time data processing
postgresql-17-age-dbgsym - debug symbols for postgresql-17-age
postgresql-17-asn1oid - ASN.1 OID data type for PostgreSQL
postgresql-17-asn1oid-dbgsym - debug symbols for postgresql-17-asn1oid
postgresql-17-auto-failover - Postgres high availability support
postgresql-17-auto-failover-dbgsym - debug symbols for postgresql-17-auto-failover
postgresql-17-bgw-replstatus - report whether PostgreSQL node is master or standby
postgresql-17-bgw-replstatus-dbgsym - debug symbols for postgresql-17-bgw-replstatus
postgresql-17-credcheck - PostgreSQL username/password checks
postgresql-17-credcheck-dbgsym - debug symbols for postgresql-17-credcheck
postgresql-17-cron - Run periodic jobs in PostgreSQL
postgresql-17-cron-dbgsym - debug symbols for postgresql-17-cron
postgresql-17-dbgsym - debug symbols for postgresql-17
postgresql-17-debversion - Debian version number type for PostgreSQL
postgresql-17-debversion-dbgsym - debug symbols for postgresql-17-debversion
postgresql-17-decoderbufs - logical decoder output plugin to deliver data as Protocol Buffers
postgresql-17-decoderbufs-dbgsym - debug symbols for postgresql-17-decoderbufs
postgresql-17-dirtyread - Read dead but unvacuumed tuples from a PostgreSQL relation
postgresql-17-dirtyread-dbgsym - debug symbols for postgresql-17-dirtyread
postgresql-17-extra-window-functions - Extra Window Functions for PostgreSQL
postgresql-17-extra-window-functions-dbgsym - debug symbols for postgresql-17-extra-window-functions
postgresql-17-first-last-agg - PostgreSQL extension providing first and last aggregate functions
postgresql-17-first-last-agg-dbgsym - debug symbols for postgresql-17-first-last-agg
postgresql-17-h3 - PostgreSQL bindings for H3, a hierarchical hexagonal geospatial indexing system
postgresql-17-h3-dbgsym - debug symbols for postgresql-17-h3
postgresql-17-hll - HyperLogLog extension for PostgreSQL
postgresql-17-hll-dbgsym - debug symbols for postgresql-17-hll
postgresql-17-http - HTTP client for PostgreSQL, retrieve a web page from inside the database
postgresql-17-http-dbgsym - debug symbols for postgresql-17-http
postgresql-17-hypopg - PostgreSQL extension adding support for hypothetical indexes.
postgresql-17-hypopg-dbgsym - debug symbols for postgresql-17-hypopg
postgresql-17-icu-ext - PostgreSQL extension exposing functionality from the ICU library
postgresql-17-icu-ext-dbgsym - debug symbols for postgresql-17-icu-ext
postgresql-17-ip4r - IPv4 and IPv6 types for PostgreSQL 17
postgresql-17-ip4r-dbgsym - debug symbols for postgresql-17-ip4r
postgresql-17-jsquery - PostgreSQL JSON query language with GIN indexing support
postgresql-17-jsquery-dbgsym - debug symbols for postgresql-17-jsquery
postgresql-17-londiste-sql - SQL infrastructure for Londiste
postgresql-17-mimeo - specialized, per-table replication between PostgreSQL instances
postgresql-17-mobilitydb - Open source geospatial trajectory data management & analysis platform
postgresql-17-mobilitydb-dbgsym - debug symbols for postgresql-17-mobilitydb
postgresql-17-mysql-fdw - Postgres 17 Foreign Data Wrapper for MySQL
postgresql-17-mysql-fdw-dbgsym - debug symbols for postgresql-17-mysql-fdw
postgresql-17-numeral - numeral datatypes for PostgreSQL
postgresql-17-numeral-dbgsym - debug symbols for postgresql-17-numeral
postgresql-17-ogr-fdw - PostgreSQL foreign data wrapper for OGR
postgresql-17-ogr-fdw-dbgsym - debug symbols for postgresql-17-ogr-fdw
postgresql-17-omnidb - PostgreSQL PL/pgSQL debugger extension for OmniDB
postgresql-17-omnidb-dbgsym - debug symbols for postgresql-17-omnidb
postgresql-17-oracle-fdw - PostgreSQL Foreign Data Wrapper for Oracle
postgresql-17-oracle-fdw-dbgsym - debug symbols for postgresql-17-oracle-fdw
postgresql-17-orafce - Oracle support functions for PostgreSQL 17
postgresql-17-orafce-dbgsym - debug symbols for postgresql-17-orafce
postgresql-17-partman - PostgreSQL Partition Manager
postgresql-17-partman-dbgsym - debug symbols for postgresql-17-partman
postgresql-17-periods - PERIODs and SYSTEM VERSIONING for PostgreSQL
postgresql-17-periods-dbgsym - debug symbols for postgresql-17-periods
postgresql-17-pg-catcheck - Postgres system catalog checker
postgresql-17-pg-catcheck-dbgsym - debug symbols for postgresql-17-pg-catcheck
postgresql-17-pg-checksums - Activate/deactivate/verify PostgreSQL data checksums
postgresql-17-pg-checksums-dbgsym - debug symbols for postgresql-17-pg-checksums
postgresql-17-pg-fact-loader - Build fact tables asynchronously with Postgres
postgresql-17-pg-failover-slots - High-availability support for PostgreSQL logical replication
postgresql-17-pg-failover-slots-dbgsym - debug symbols for postgresql-17-pg-failover-slots
postgresql-17-pg-hint-plan - support for optimizer hints in PostgreSQL
postgresql-17-pg-hint-plan-dbgsym - debug symbols for postgresql-17-pg-hint-plan
postgresql-17-pg-permissions - see all permissions in a PostgreSQL database
postgresql-17-pg-qualstats - PostgreSQL extension to gather statistics about predicates.
postgresql-17-pg-qualstats-dbgsym - debug symbols for postgresql-17-pg-qualstats
postgresql-17-pg-rrule - RRULE data type for PostgreSQL
postgresql-17-pg-rrule-dbgsym - debug symbols for postgresql-17-pg-rrule
postgresql-17-pg-stat-kcache - PostgreSQL extension to gather per-query kernel statistics.
postgresql-17-pg-stat-kcache-dbgsym - debug symbols for postgresql-17-pg-stat-kcache
postgresql-17-pg-track-settings - PostgreSQL extension tracking of configuration settings
postgresql-17-pg-wait-sampling - Extension providing statistics about PostgreSQL wait events
postgresql-17-pg-wait-sampling-dbgsym - debug symbols for postgresql-17-pg-wait-sampling
postgresql-17-pgaudit - PostgreSQL Audit Extension
postgresql-17-pgaudit-dbgsym - debug symbols for postgresql-17-pgaudit
postgresql-17-pgauditlogtofile - PostgreSQL pgAudit Add-On to redirect audit logs
postgresql-17-pgauditlogtofile-dbgsym - debug symbols for postgresql-17-pgauditlogtofile
postgresql-17-pgextwlist - PostgreSQL Extension Whitelisting
postgresql-17-pgextwlist-dbgsym - debug symbols for postgresql-17-pgextwlist
postgresql-17-pgfaceting - Faceted query acceleration for PostgreSQL using roaring bitmaps
postgresql-17-pgfincore - set of PostgreSQL functions to manage blocks in memory
postgresql-17-pgfincore-dbgsym - debug symbols for postgresql-17-pgfincore
postgresql-17-pgl-ddl-deploy - Transparent DDL replication for PostgreSQL
postgresql-17-pgl-ddl-deploy-dbgsym - debug symbols for postgresql-17-pgl-ddl-deploy
postgresql-17-pglogical - Logical Replication Extension for PostgreSQL
postgresql-17-pglogical-dbgsym - debug symbols for postgresql-17-pglogical
postgresql-17-pglogical-ticker - Have time-based replication delay for pglogical
postgresql-17-pglogical-ticker-dbgsym - debug symbols for postgresql-17-pglogical-ticker
postgresql-17-pgmemcache - PostgreSQL interface to memcached
postgresql-17-pgmemcache-dbgsym - debug symbols for postgresql-17-pgmemcache
postgresql-17-pgmp - arbitrary precision integers and rationals for PostgreSQL 17
postgresql-17-pgmp-dbgsym - debug symbols for postgresql-17-pgmp
postgresql-17-pgnodemx - capture node OS metrics from PostgreSQL
postgresql-17-pgnodemx-dbgsym - debug symbols for postgresql-17-pgnodemx
postgresql-17-pgpcre - Perl Compatible Regular Expressions (PCRE) extension for PostgreSQL
postgresql-17-pgpcre-dbgsym - debug symbols for postgresql-17-pgpcre
postgresql-17-pgpool2 - connection pool server and replication proxy for PostgreSQL - modules
postgresql-17-pgpool2-dbgsym - debug symbols for postgresql-17-pgpool2
postgresql-17-pgq-node - Cascaded queueing on top of PgQ
postgresql-17-pgq3 - Generic queue for PostgreSQL
postgresql-17-pgq3-dbgsym - debug symbols for postgresql-17-pgq3
postgresql-17-pgrouting - Routing functionality support for PostgreSQL/PostGIS
postgresql-17-pgrouting-dbgsym - debug symbols for postgresql-17-pgrouting
postgresql-17-pgrouting-doc - Routing functionality support for PostgreSQL/PostGIS (Documentation)
postgresql-17-pgrouting-scripts - Routing functionality support for PostgreSQL/PostGIS - SQL scripts
postgresql-17-pgsphere - Spherical data types for PostgreSQL
postgresql-17-pgsphere-dbgsym - debug symbols for postgresql-17-pgsphere
postgresql-17-pgtap - Unit testing framework extension for PostgreSQL 17
postgresql-17-pgtt - PostgreSQL Global Temporary Tables
postgresql-17-pgtt-dbgsym - debug symbols for postgresql-17-pgtt
postgresql-17-pgvector - Open-source vector similarity search for Postgres
postgresql-17-pgvector-dbgsym - debug symbols for postgresql-17-pgvector
postgresql-17-pldebugger - PostgreSQL pl/pgsql Debugger API
postgresql-17-pldebugger-dbgsym - debug symbols for postgresql-17-pldebugger
postgresql-17-pljava - Java procedural language for PostgreSQL 17
postgresql-17-pljava-dbgsym - debug symbols for postgresql-17-pljava
postgresql-17-pllua - Lua procedural language for PostgreSQL 17
postgresql-17-pllua-dbgsym - debug symbols for postgresql-17-pllua
postgresql-17-plpgsql-check - plpgsql_check extension for PostgreSQL
postgresql-17-plpgsql-check-dbgsym - debug symbols for postgresql-17-plpgsql-check
postgresql-17-plprofiler - PostgreSQL PL/pgSQL functions performance profiler
postgresql-17-plprofiler-dbgsym - debug symbols for postgresql-17-plprofiler
postgresql-17-plproxy - database partitioning system for PostgreSQL 17
postgresql-17-plproxy-dbgsym - debug symbols for postgresql-17-plproxy
postgresql-17-plr - Procedural language interface between PostgreSQL and R
postgresql-17-plr-dbgsym - debug symbols for postgresql-17-plr
postgresql-17-plsh - PL/sh procedural language for PostgreSQL 17
postgresql-17-plsh-dbgsym - debug symbols for postgresql-17-plsh
postgresql-17-pointcloud - PostgreSQL extension for storing point cloud (LIDAR) data
postgresql-17-pointcloud-dbgsym - debug symbols for postgresql-17-pointcloud
postgresql-17-postgis-3 - Geographic objects support for PostgreSQL 17
postgresql-17-postgis-3-dbgsym - debug symbols for postgresql-17-postgis-3
postgresql-17-postgis-3-scripts - Geographic objects support for PostgreSQL 17 -- SQL scripts
postgresql-17-powa - PostgreSQL Workload Analyzer -- PostgreSQL 17 extension
postgresql-17-powa-dbgsym - debug symbols for postgresql-17-powa
postgresql-17-prefix - Prefix Range module for PostgreSQL
postgresql-17-prefix-dbgsym - debug symbols for postgresql-17-prefix
postgresql-17-preprepare - pre prepare your PostgreSQL statements server side
postgresql-17-preprepare-dbgsym - debug symbols for postgresql-17-preprepare
postgresql-17-prioritize - Get and set the nice priorities of PostgreSQL backends
postgresql-17-prioritize-dbgsym - debug symbols for postgresql-17-prioritize
postgresql-17-q3c - PostgreSQL 17 extension used for indexing the sky
postgresql-17-q3c-dbgsym - debug symbols for postgresql-17-q3c
postgresql-17-rational - Precise fractional arithmetic for PostgreSQL
postgresql-17-rational-dbgsym - debug symbols for postgresql-17-rational
postgresql-17-repack - reorganize tables in PostgreSQL databases with minimal locks
postgresql-17-repack-dbgsym - debug symbols for postgresql-17-repack
postgresql-17-repmgr - replication manager for PostgreSQL 17
postgresql-17-repmgr-dbgsym - debug symbols for postgresql-17-repmgr
postgresql-17-roaringbitmap - RoaringBitmap extension for PostgreSQL
postgresql-17-roaringbitmap-dbgsym - debug symbols for postgresql-17-roaringbitmap
postgresql-17-rum - PostgreSQL RUM access method
postgresql-17-rum-dbgsym - debug symbols for postgresql-17-rum
postgresql-17-semver - Semantic version number type for PostgreSQL
postgresql-17-semver-dbgsym - debug symbols for postgresql-17-semver
postgresql-17-set-user - PostgreSQL privilege escalation with enhanced logging and control
postgresql-17-set-user-dbgsym - debug symbols for postgresql-17-set-user
postgresql-17-show-plans - Show query plans of currently running PostgreSQL statements
postgresql-17-show-plans-dbgsym - debug symbols for postgresql-17-show-plans
postgresql-17-similarity - PostgreSQL similarity functions extension
postgresql-17-similarity-dbgsym - debug symbols for postgresql-17-similarity
postgresql-17-slony1-2 - replication system for PostgreSQL: PostgreSQL 17 server plug-in
postgresql-17-slony1-2-dbgsym - debug symbols for postgresql-17-slony1-2
postgresql-17-snakeoil - PostgreSQL anti-virus scanner based on ClamAV
postgresql-17-snakeoil-dbgsym - debug symbols for postgresql-17-snakeoil
postgresql-17-squeeze - PostgreSQL extension for automatic bloat cleanup
postgresql-17-squeeze-dbgsym - debug symbols for postgresql-17-squeeze
postgresql-17-statviz - PostgreSQL internal statistics analysis and visualization
postgresql-17-tablelog - log changes on tables and restore tables to point in time
postgresql-17-tablelog-dbgsym - debug symbols for postgresql-17-tablelog
postgresql-17-tdigest - t-digest algorithm for on-line accumulation of rank-based statistics
postgresql-17-tdigest-dbgsym - debug symbols for postgresql-17-tdigest
postgresql-17-tds-fdw - PostgreSQL foreign data wrapper for TDS databases
postgresql-17-tds-fdw-dbgsym - debug symbols for postgresql-17-tds-fdw
postgresql-17-timescaledb - time-series SQL database optimized for fast ingest and complex queries
postgresql-17-timescaledb-dbgsym - debug symbols for postgresql-17-timescaledb
postgresql-17-toastinfo - Show storage structure of varlena datatypes in PostgreSQL
postgresql-17-toastinfo-dbgsym - debug symbols for postgresql-17-toastinfo
postgresql-17-unit - SI Units for PostgreSQL
postgresql-17-unit-dbgsym - debug symbols for postgresql-17-unit
postgresql-17-wal2json - PostgreSQL logical decoding JSON output plugin
postgresql-17-wal2json-dbgsym - debug symbols for postgresql-17-wal2json
postgresql-client-17 - front-end programs for PostgreSQL 17
```

## Other tasks

- [ ] GHA to rebuild and push when version changes via renovate (replace tag file and build task)
- [ ] Instructions for all extensions (sample scripts)
- [ ] Sample databases for graph, vector, time series etc
- [ ] Change HA port number
- [ ] Update pgadmin (& other guis) config