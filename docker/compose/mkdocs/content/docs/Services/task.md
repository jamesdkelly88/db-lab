# Task

[:fontawesome-solid-globe: Project Homepage](https://taskfile.dev/)

[:simple-git: Repository](https://github.com/go-task/task)

This repository uses a single global taskfile to manage the database lab. Use `task list-all` to view the configured tasks and their descriptions.

## Basic usage

From a subfolder in `docker/compose`, run `task up` to launch the container(s). Run `task down` to stop them, and `task destroy` to stop them and delete any docker volumes.

`task all-up` and `task all-down` can be run from anywhere in the repository to start/stop all containers.

Dependencies are embedded into the tasks, so these are managed automatically.

## Things to update

DNS domain is defined as environment variable `DOMAIN` in the task file - this is used in docker compose files so must be set. I use DuckDNS to provide my DNS service (it's free for 5 sub-domains, and compatible with ddns, LetsEncrypt etc).

If adding new docker networks, these should be defined as external in the docker compose files, and added to the variable `DOCKER_NETWORKS` (space delimited) in the taskfile.

## Important note

An assumption has been made that while exploring a database technology you will have access to appropriate tooling on your local machine, so the `backup` and `sample` tasks rely on these tools being installed.

