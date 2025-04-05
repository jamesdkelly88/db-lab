---
tags:
  - utility
---
# Traefik

[:fontawesome-solid-globe: Project Homepage](https://traefik.io/traefik/)

[:simple-git: Repository](https://github.com/traefik)

[:simple-docker: Container Registry](https://hub.docker.com/_/traefik)

Reverse proxy for web services

Web containers need to have the label `traefik.enable=true` in their `docker-compose.yml` definition. Container name, service name and DNS sub-domain should all match, so the default rule for routing picks them up correctly.

## Images
| Image | Tag |
| --- | --- |
| traefik | v2.11.22 |

## Ports
- 80

## Links
- [http://traefik.jkdb.duckdns.org](http://traefik.jkdb.duckdns.org)

