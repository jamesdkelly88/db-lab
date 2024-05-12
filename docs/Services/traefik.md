# Traefik

Reverse proxy for web services

## Requirements

- Web containers need to have the label `traefik.enable=true` in their `docker-compose.yml` definition
- Container name, service name and DNS sub-domain should all match, so the default rule for routing picks them up correctly