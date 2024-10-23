# Microsoft SQL Server

Microsoft SQL Server (Structured Query Language) is a proprietary relational database management system developed by Microsoft

[:fontawesome-solid-globe: Project Homepage](https://www.microsoft.com/en-gb/sql-server)

[:simple-docker: Container Registry](https://mcr.microsoft.com/en-us/catalog?cat=Databases&alphaSort=asc&alphaSortKey=Name)

## Requirements

MSSQL tools are required on a Linux machine to provide the ODBC drivers for Python. Powershell requires the SqlServer module to connect. Scripts are provided by Microsoft for downloading these tools.

There is no official web interface for SQL Server.

SQL Server has supported Linux containers since 2017. All versions since then are included in this lab. The latest version (2022) is exposed on the default port `1433`. 2019 is exposed on port `1434` and 2017 on `1435`. When new versions are released (every 2-3 years) these port numbers will increment to ensure the latest version is always using the default port.