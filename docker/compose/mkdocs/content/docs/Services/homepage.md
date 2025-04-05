---
tags:
  - utility
---
# Homepage

[:fontawesome-solid-globe: Project Homepage](https://gethomepage.dev/)

[:simple-git: Repository](https://github.com/gethomepage/homepage)

[:simple-docker: Container Registry](https://ghcr.io/gethomepage/homepage)

A highly customizable homepage with Docker and service API integrations.

The following labels need defining for homepage to auto-discover running services:

- homepage.group

- homepage.name

- homepage.icon

- homepage.description

In addition, for homepage to add a link (rather than just show container status), the label `homepage.href` is required.

Using auto-discovery will ensure that homepage only shows services which have been deployed, and allows it to be used as a health-check page, forgoing the need for something like Portainer.

If ports are exposed, these should be included at the end of the description for ease of use, e.g. `PostgreSQL v16 (54326)`

## Images
| Image | Tag |
| --- | --- |
| ghcr.io/gethomepage/homepage | v0.10.9 |

## Links
- [http://homepage.jkdb.duckdns.org](http://homepage.jkdb.duckdns.org)

