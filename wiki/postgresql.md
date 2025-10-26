# PostgreSQL

[PostgreSQL](https://www.postgresql.org/) is a free and open-source relational database managment
system. 

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[postgres image](/wiki/docker/postgres.md).

## Usage

This section addresses the usage of PostgreSQL.

### Basic Usage

This section describes the basic usage and is based on a
[blog entry on Neon](https://neon.com/postgresql/postgresql-administration/postgresql-show-tables).

The following command can be used to connect to the database and is needed to be run first. 
`<user>` is the username and `<database>` the name of the database set up for the database.

```sh
psql -U <user> -d <database>
```

Alternatively the previous command can be run without the `-d` flag and the following command can
be run afterwards to change the current database.

```sh
\c <database>
```

Afterwards the following command can be used to show all tables in the database.

```sh
\dt
```

By appending a `+` additional information can be shown

```sh
\dt+
```

Similar to this the following command can be used to show details of a specific table `<table>`.

```sh
\d <table>
```

Here a `+` can also be appended to gain more information.

```sh
\d+ <table>
```

Finally and most importantly classic SQL statements - for example `SELECT`-statements - can be used
too when being logged in to a database.
