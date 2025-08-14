FROM postgres:17.6

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        postgresql-$PG_MAJOR-age \
        postgresql-$PG_MAJOR-cron \
        postgresql-$PG_MAJOR-h3 \
        postgresql-$PG_MAJOR-oracle-fdw \
        postgresql-$PG_MAJOR-pgaudit \  
        postgresql-$PG_MAJOR-pgtt \  
        postgresql-$PG_MAJOR-pgvector \  
        postgresql-$PG_MAJOR-postgis-3 \    
        postgresql-$PG_MAJOR-tds-fdw \
        postgresql-$PG_MAJOR-timescaledb \
        postgresql-plperl-$PG_MAJOR \
    && rm -rf /var/lib/apt/lists/*