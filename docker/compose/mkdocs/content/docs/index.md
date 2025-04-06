# Introduction

This repository is my database lab. It provides containerised environments for many database platforms and some supporting technologies.

## Pre-requisites

- Docker installed on the host and available to the current user
- Unix tools on the path (if running on Windows using Docker Desktop, these are included with Git and located at `c:\Program Files\Git\usr\bin`)
- [Task](https://taskfile.dev/)
- A DNS domain (I use [DuckDNS](https://www.duckdns.org/) because it's free and supports subdomains)
- If using tests, then the tools and dependencies for those need to be installed (e.g. python, powershell, go etc)
- [Nix Shell](https://nix.dev/install-nix), if you want to use the predefined shell environment that includes all the dependencies

## Setup

1. Clone the repository
2. Update `db-lab.env` with the following values:
    - DOMAIN : this should be the DNS domain for the lab
    - SECRET_EMAIL: this email address is used wherever docker compose requires an email address. It doesn't have to be real.
    - SECRET_PASSWORD: this password is used for every password in docker compose files.
    - SECRET_USER: this username is used wherever a default is not provided in docker compose files.
3. Run `task hello` anywhere in this repository to test that task is installed and the taskfile is valid.
4. To launch an minimal setup (homepage, reverse proxy, and these docs), run `task baseline-up`
5. Browse to `http://homepage.<your-dns-domain>`

## Usage

| Task name | Activity | Location to run |
| --- | --- | --- |
| up | Launch the container stack | `docker/compose/<stack>` |
| down | Stop the container stack | `docker/compose/<stack>` |
| destroy | Stop the container stack and delete any volumes | `docker/compose/<stack>` |
| backup | Backup the database (using docker containers) | `docker/compose/<stack>` |
| test-go | Test the database using Go | `docker/compose/<stack>` |
| test-pwsh | Test the database using Powershell | `docker/compose/<stack>` |
| test-py | Test the database using Python | `docker/compose/<stack>` |
| build | Build the docker image | `docker/image/<name>` |
| publish | Build the docker image and publish to docker hub (must be logged in) | `docker/image/<name>` |
| cleanup | Delete unused docker images | repository root |
| basline-up | Launch a minimal environment | repository root |
| core | Launch a full environment (with no database services) | repository root |
| networks | Create the required docker networks | repository root |
| pre-commit | Run the helper scripts (before committing changes) | repository root |
| all-up | Launch everything in the repository | repository root |
| all-down | Stop everything in the repository | repository root |
| all-destroy | Stop everything in the repository and delete any volumes and networks | repository root |
| all-backup | Run every available backup task in the repository | repository root |
| all-test-go | Run every available go test in the repository | repository root |
| all-test-pwsh | Run every available powershell test in the repository | repository root |
| all-test-py | Run every available python test in the repository | repository root |
| create-folder-shell | Create the required files for a new stack in an empty folder | a new folder |

## Folder structure

```
├── docker
│   ├── compose
│   │   └── <technology>                                            1 folder per database/tool - major versions have their own folders
│   │       ├── tests                                               
│   │       │   ├── go                                              
│   │       │   │   ├── go.mod                                      go dependencies file
│   │       │   │   ├── go.sum                                      go dependencies checksums
│   │       │   │   └── test.go                                     go test script
│   │       │   ├── powershell
│   │       │   │   └── test.ps1                                    powershell test script
│   │       │   └── python
│   │       │       ├── requirements.txt                            python dependencies file
│   │       │       └── test.py                                     python test script
│   │       ├── backup.sh                                           shell script to backup the database using docker container(s)
│   │       ├── docker-compose.yml                                  definition of the container stack for the database/tool
│   │       ├── info.json                                           a few values used by the script to generate documentation
│   │       └── <other files for mounting in containers>
│   └── images
│       └── <name>
│           ├── Dockerfile                                          definition of the container image
│           ├── tag                                                 text file containing the tag name to publish the image with
│           └── <other files for building the image>
├── samples
│   └── <database name>
│       ├── <engine>.sh                                             shell script to create and populate the sample database
│       ├── <another_engine>.sh                                     some databases are compatible with multiple database engines
│       └── data
│           └── <files to populate the schema/data, if required>
├── db-lab.env                                                      environment file containing common variables for using the lab. You should update this
├── README.md                                                       repository documentation, which just links to this page
├── renovate.json                                                   configuration for renovate, which automatically updates container and dependency versions 
├── shell.nix                                                       nix config file that can be used to create a temporary shell environment with all required tools installed
├── Taskfile.yml                                                    task config file that contains definitions of the automated activities for this repository
└── .gitignore                                 
```

## Contributing

Contributions welcome! I have a very long list of databases and tools that I would like to include here, when I have the time. If you want to request one, raise an issue on GitHub. If you want to add one yourself, feel free, but please follow the style and setup that I have used to maintain compatibility and consistency:

- Stack and container naming
- Use of environment variables from task file
- Inclusion of test scripts and sample databases
- Container labels for automatic discovery by homepage, traefik and wud
- Documentation!!!