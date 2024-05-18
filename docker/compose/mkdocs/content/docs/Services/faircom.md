# Faircom DB

FairCom DB formerly (C-Tree until 2020) natively supports SQL, JSON, and binary data within the same record, giving you both flexibility and speed.

[:fontawesome-solid-globe: Project Homepage](https://www.faircom.com/)

## Requirements

Visit [their website](https://www.faircom.com/products/download-db) and fill in some details to download the free version for Linux x64 64-bit) and save it into `docker/compose/faircomdb/source` before running `task up`.

Important note: because this is a demo version of the FairCom DB server, the process will self-terminate after 3 hours (which will restart the container), so a volume is required to persist the databases.

Default credential is `admin:ADMIN`