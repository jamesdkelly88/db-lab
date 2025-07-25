---
tags:
  - utility
---
# Minio

[:fontawesome-solid-globe: Project Homepage](https://min.io/)

[:simple-git: Repository](https://github.com/minio/minio)

[:simple-docker: Container Registry](https://hub.docker.com/r/minio/minio)

AWS S3-like block storage

To use minio in place of AWS S3, you need the `aws` command line interface (CLI) installed. The following environment variables should be set to divert traffic from AWS to minio:

- `AWS_ACCESS_KEY_ID` - set to minio username

- `AWS_SECRET_ACCESS_KEY` - set to minio password

- `AWS_DEFAULT_REGION` - set to `us-east-1`

- `AWS_ENDPOINT_URL_S3` - set to `<minio host>:9000`

This is the only service in the lab that uses a local directory mount instead of a docker volume. This is so backups persist even after a full destroy of the lab environment.

## Images
| Image | Tag |
| --- | --- |
| minio/minio | RELEASE.2025-07-23T15-54-02Z-cpuv1 |

## Ports
- 9000

## Links
- [http://minio.jkdb.duckdns.org](http://minio.jkdb.duckdns.org)

