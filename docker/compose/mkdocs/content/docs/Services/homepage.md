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

- homepage.href

- homepage.icon

- homepage.description

The href label is required to appear in the quick search, even if there is no web interface (# is used in this case).

Using auto-discovery will ensure that homepage only shows services which have been deployed, and allows it to be used as a health-check page, forgoing the need for something like Portainer.

The title of each tile is the database (and the version number if more than 1 is available).

The description of each tile should contain the supported types (for databases) and the targets (for web interfaces).

If ports are exposed, these should be included at the end of the description for ease of use, e.g. `Graph | Relational (54326)`

The page can be searched by typing anywhere except the search box

## Images
| Image | Tag |
| --- | --- |
| ghcr.io/gethomepage/homepage | v1.4.0 |

## Links
- [http://homepage.jkdb.duckdns.org](http://homepage.jkdb.duckdns.org)

