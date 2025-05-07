---
tags:
  - relational
---
# Microsoft SQL Server 2019

[:fontawesome-solid-globe: Project Homepage](https://www.microsoft.com/en-gb/sql-server)

[:simple-docker: Container Registry](https://mcr.microsoft.com/en-us/catalog?cat=Databases&alphaSort=asc&alphaSortKey=Name)

[:material-database: DBDB.io](https://dbdb.io/db/sql-server)

Microsoft SQL Server (Structured Query Language) is a proprietary relational database management system developed by Microsoft

There is no official web interface for SQL Server.

SQL Server has supported Linux containers since 2017. All versions since then are included in this lab. The latest version is exposed on the default port `1433`, with each older version using the next port number (`1434`, `1435` etc). When new versions are released (every 2-3 years) these port numbers will increment to ensure the latest version is always using the default port.

## GUI

- [DbGate](../dbgate)
- [SQL Server Management Studio](../sql-server-management-studio)

## Images
| Image | Tag |
| --- | --- |
| mcr.microsoft.com/mssql/rhel/server | 2019-CU28-GDR1-rhel-8.7 |

## Ports
- 1434


