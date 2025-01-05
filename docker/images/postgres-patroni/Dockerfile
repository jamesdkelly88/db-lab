FROM postgres:16.6

ENV PG_MAX_WAL_SENDERS 8
ENV PG_WAL_KEEP_SEGMENTS 8

# Clean existing sources.list to avoid duplicate entries warnings
RUN echo "deb http://deb.debian.org/debian bookworm main" > /etc/apt/sources.list && \
    echo "deb http://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian bookworm-updates main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y netcat-openbsd python3-pip curl python3-psycopg2 python3-venv iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Create a virtual environment and install Patroni and psycopg2-binary
RUN python3 -m venv /opt/patroni-venv && \
    /opt/patroni-venv/bin/pip install --upgrade pip && \
    /opt/patroni-venv/bin/pip install patroni[zookeeper] psycopg2-binary

# Copy the Patroni configuration files
COPY postgres0.yml /postgres0.yml
COPY postgres1.yml /postgres1.yml
COPY postgres2.yml /postgres2.yml

ENV PATH="/opt/patroni-venv/bin:$PATH"

# Change to the postgres user
USER postgres

CMD ["patroni", "/postgres0.yml"]