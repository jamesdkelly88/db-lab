# CloudBeaver

[:fontawesome-solid-globe: Project Homepage](https://dbeaver.com/)

[:simple-git: Repository](https://github.com/dbeaver/cloudbeaver)

[:simple-docker: Container Registry](https://hub.docker.com/r/dbeaver/cloudbeaver)

## TODO

- look at environment variables in /opt/cloudbeaver/conf/cloudbeaver.conf and add to docker compose
- define default connections file and map to /opt/cloudbeaver/conf/initial-data-sources.conf
- try adding a driver to /opt/cloudbeaver/drivers and see if it picks it up
- try the aws/enterprise versions to see if there are more drivers pre-loaded
- add drivers for anything in the lab not covered by the defaults, and include in updates