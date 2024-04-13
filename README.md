# Db-Lab

This repository is my database lab. It provides containerised environments for many database platforms and some supporting technologies.

## Documentation

Documentation is using [MkDocs](https://www.mkdocs.org/) and is contained in the `docs` folder, with a TODO: github action to integrate this with my central documentation repository build process in Azure DevOps. It can also be run independently with `mkdocs serve` or `task documentation`.

### Pre-requisites

- Python
- Pip
- MkDocs (`pip install mkdocs-material`)
- Markdown Extensions (`pip install pymdown-extensions`)

## Automation

All the services in this repository are set up to be configured using [Task](https://taskfile.dev/). 

## Services

See the docs folder for a list of what is available to deploy.

## Copyright

(C) James Kelly 2024
MIT License