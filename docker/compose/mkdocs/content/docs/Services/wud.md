# What's Up Docker

[:fontawesome-solid-globe: Project Homepage](https://gethomepage.dev/)

[:simple-git: Repository](https://github.com/gethomepage/homepage)

[:simple-docker: Container Registry](https://ghcr.io/gethomepage/homepage)

Version tracker for docker containers. 

## Requirements

For some reason I can't understand this doesn't work when using the socket proxy, so has read-only access directly to the socket.

All container images are tracked by default. To avoid false positives for new versions (latest, alpha etc), each container needs a `wud.tag.include` with a regular expression to determine which versions to consider, e.g.:

- `^\d+?.\d+?.\d+?$` (3 number semantic version - 1.2.3)
- `^v\d+?.\d+?.\d+?$` (3 number semantic version with v - v1.2.3)
- `^\d+?.\d+?$` (2 number semantic version - 1.2)
- `^v2.\d+?.\d+?$` (3 number semantic version with v, pinned to a fixed major version - v2.3.4)
- `^15.\d{1,2}-alpine.+?$` (vesion number with base image suffix - 15.1-alpine-3.18)