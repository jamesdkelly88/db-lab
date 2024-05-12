# Database Lab

This repository is my database lab. It provides containerised environments for many database platforms and some supporting technologies.

## Pre-requisites

- Docker installed on the host and available to the current user
- Unix tools on the path (if running on Windows using Docker Desktop, these are included with Git and located at `c:\Program Files\Git\usr\bin`)
- [Task](https://taskfile.dev/)
- A DNS domain (I use [DuckDNS](https://www.duckdns.org/) because it's free and supports subdomains)

## Setup

1. Clone the repository
2. Update `Taskfile.yml` with the following values:
    - env.DOMAIN : this should be the DNS domain for the lab
    - env.SECRET_EMAIL: this email address is used wherever docker compose requires an email address. It doesn't have to be real.
    - env.SECRET_PASSWORD: this password is used for every password in docker compose files.
    - env.SECRET_USER: this username is used wherever a default is not provided in docker compose files.
3. Run `task hello` anywhere in this repository to test that task is installed and the taskfile is valid.
4. To launch an minimal setup (homepage, reverse proxy, and these docs), run `task baseline-up`
5. Browse to `http://homepage.<your-dns-domain>`

See the [Task](Services/task.md) documentation for more information.

## Contributing

Contributions welcome! I have a very long list of databases and tools that I would like to include here, when I have the time. If you want to request one, raise an issue on GitHub. If you want to add one yourself, feel free, but please follow the style and setup that I have used to maintain compatibility and consistency:

- Stack and container naming
- Use of environment variables from task file
- Inclusion of test scripts and sample databases
- Container labels for automatic discovery by homepage, traefik and wud
- Documentation!!!