---
date: 2024-07-17
title: Working with Oracle databases in open-source projects
authors:
  - matt-cloyd
tags:
  - tutorial
  - database
  - open source
  - how we work
excerpt: >
  Follow this step-by-step tutorial to gain access to data locked
  inside proprietary Oracle databases, so you can use it in your
  open-source project.
image: /assets/blog/oracle-databases/oracle-databases.png
---

_Reference to any non-federal entity does not constitute or imply its endorsement, recommendation, or favoring by GSA._

## Introduction

During a recent 18F project, we built an open-source prototype with a twist: all of the data for our project was locked in a closed-source Oracle database, with no way to export it to an open format.

After days of cobbling together research from across the internet, we managed to set up an Oracle database and connect it to an open-source web application. This is the post we wish we had when we started.

If you need an Oracle database in your open-source project, quickly and for free, then welcome to our step-by-step technical tutorial. Fun fact: this is 18F's first technical tutorial blog post [since 2016]({{ "/2016/04/08/how-we-get-high-availability-with-elasticsearch-and-ruby-on-rails/" | url }})!

### Before you begin

In writing this tutorial, we assume you're already familiar with [using the command line]({{ "/2015/03/03/how-to-use-github-and-the-terminal-a-guide/" | url }}), and with the basics of setting up and connecting to Docker containers. We use Macs at 18F, but if you use Windows, nearly everything except file path formats should be the same.

**By the end of this tutorial**, we expect that you'll have a working Oracle database running in Docker. We will provide guidance on importing data, but we can't guarantee you'll have everything fully imported — it depends largely on the nature of your data.

#### Our challenge

During a recent project, we were developing an open-source prototype that was all about the data — everything we prototyped had something to do with the data model, how data was stored, and what needed to happen to get the data ready to transform.

So, we needing realistic data, and we received approval to use data from a non-production database.

The only data we could access, however, was a database export file from a no-longer-supported Oracle 12c database.

We hoped we could simply convert the data to something usable [in our default database, Postgres](https://guides.18f.gov/engineering/tools/datastore-selection). However, it’s not trivial to convert data between database platforms, and tools that offer conversion between Oracle and Postgres are either costly, not secure, or excessively challenging to understand and use.

We considered asking the database administrator re-export to CSV, but we needed the full dataset of several hundred thousand rows with all their relationships preserved. CSV export would only be appropriate if we needed just a handful of tables, or could live without those relationships.

We decided we needed the full database to accomplish the prototype’s objectives. Procuring an Oracle database wasn’t an option on our timeline.

So — what to do?


#### Discovering Oracle’s free databases

Fortunately, we discovered that Oracle provides two free versions of their database — Oracle Free and Oracle Express Edition (XE).

Both databases provide a single database instance that can hold up to 12 GB. We couldn't discern any meaningful differences between these databases — as far as we can tell, the primary difference is the name. The only other difference we spotted was that, when we imported data into Free, we noticed about 3% fewer data import errors than when we imported into Express.

Both databases are available on [Oracle's container registry, container-registry.oracle.com](https://container-registry.oracle.com). You don’t need an Oracle account to access the free databases, but you do have to get them from Oracle’s registry — neither database image is available on Docker Hub.

If your database is larger than 12 GB, you may need to export a smaller subset of your data. In our case, the tabular data itself was almost 12 GB in size. We were able to load all of the tabular data, but other objects like indices and constraints were dropped during import because they didn’t fit inside that 12 GB. Fortunately, we didn’t need those additional objects, and the database continued working well enough.

We arbitrarily chose Express to start with, so this tutorial will cover Express. If you choose to use Free, make sure to change the image URL and the database name in the examples below.

Ok, let’s start the tutorial!

## Tutorial

This tutorial uses curly braces `{% raw %}{{{% endraw %} }}` to indicate when you should replace something with your own information. For example, if your Oracle database password is `"my-secure-password" (don't use this), and you see a block like

```
ORACLE_PASSWORD={% raw %}{{{% endraw %} your secure password }}
```

your version should look like

```
ORACLE_PASSWORD=my-secure-password
```

### Part 1: Running an Oracle database using Docker

We’ll use Docker Compose to install and run an Oracle database. Once we have an empty database running, we'll start importing data in Part 2 below.

#### Setting up the container

Let's think through the setup before we run any code.

First, we know want any data we import into the Oracle database to persist (stick around) even if the container stops or crashes. To make sure that the data in the database persists, we’ll create a volume that links to the Oracle data directory. The details of how Docker volumes work are outside the scope of this tutorial, but you can always go to Docker to read up.

Second, we want to make sure the Oracle database can see the data file we’re going to import into the database. (This tutorial assumes you have a data file exported from another Oracle database.) So, we’ll create a second volume that connects the folder containing our data import file to a folder in the container. That way, when we tell the database to import the file, it can find it.

Let’s run the container for the first time, with our two volumes and a few more features we’ll explain in a moment!

First, set up a docker-compose.yml file with the following content:

```
docker-compose.yml
```
```yaml
version: "3"

services:

  oracledb:
    image: container-registry.oracle.com/database/express:21.3.0-xe
    volumes:
      - ${FOLDER_WITH_IMPORT_FILE}:/db/data
      - oracle_data_volume:/opt/oracle/
    ports:
      - 1521:1521
    environment:
      - ORACLE_PWD=${ORACLE_PASSWORD}

volumes:
  oracle_data_volume:

```

Next, let’s set up an environment file (`.env`) that contains the Oracle username, the Oracle password, and information about the file we want to import. We’ll keep this separate from docker-compose.yml so that secrets that could make hacking easier — username, password, info about your filesystem — aren’t published. Make sure that .env cannot be checked into your version control system, so add it to your global .gitignore.

Generate a random password for your database by running a command like `openssl rand -base64 24`. Make sure the only special characters in the password are `_`, `$`, and `#`, since Oracle has a hard time with special characters other than these. Then set this value as the `ORACLE_PASSWORD` in the `.env` file.

```
.env
```
```sh
ORACLE_USER=system
ORACLE_PASSWORD={% raw %}{{{% endraw %} your secure password }}
IMPORT_FILE={% raw %}{{{% endraw %} name of the file to import, e.g. export.dmp }}
FOLDER_WITH_IMPORT_FILE={% raw %}{{{% endraw %} folder containing the import file as a path relative to the Docker Compose file, e.g. ./db/data }}
```

Let’s explain what’s going on here.

On line 5 of docker-compose.yml, we specify `oracledb` as the name of the container. Line 6 sets the link to the image, which we get from the Oracle container registry page.

On line 8, we link our computer’s `./db/data` folder (or the folder specified in .env) to the container’s `/db/data`. Note the period-slash (`./`) in the host path `./db/data` — that dot indicates that we’re specifying a relative path starting from our current directory.

On line 9, we create a persistent volume that links the container’s `/opt/oracle/` to a Docker-managed folder on our host computer. This is the volume that holds all the Oracle database data, so if the container goes down or gets deleted, it knows where to look for the data we will have imported by the end of this tutorial. Since we're not using the format `host_path:container_path`, this line is just specifying the container path, so Docker chooses a location on the host that we don't really need to know about. This is fine when we’re just persisting data, but it’ll take a little more digging if we ever want to look at the data just using our host computer.

The port mapping on lines 10 and 11 connects our host port 1521 to Oracle’s default port 1521 on the container. This lets us connect to the database on our host computer, meaning that we don’t have to be inside the container to get to the database. We won’t be doing anything with that in this post, since all the commands connect to the database from inside the container, but it’ll be important in the next post when we connect a Rails app running on our host computer to the database in the container.

Lastly, the environment-setting block on lines 12 and 13 set a default password for the default database users, which we are storing securely in a .env file that we don’t check into version control. Setting this in the container environment gives us a known password to use when logging in later on.

The block at the end starting with `volumes` just names the volumes to create. We need that block for the reference to `oracle_data_volume` in the `oracledb` service to work.

#### Checking that the database works

Let’s start the database!

First, run `docker compose config`.

If you get an error, you missed including a template value like `${ORACLE_PASSWORD}`. Otherwise, you don’t have to read the output of this command — it’s a lot!

Next, run `docker compose up`. This should start the container

Let’s make sure that the container started correctly, with all the volumes correctly linked. Try listing the files in the `./db/data` folder both on the host machine and in the container — if we set everything up right, you’ll see the same files listed.

```sh
$ ls -l ./db/data
# ... list of files ...

$ docker compose exec -it oracledb ls -l /db/data
# ... hopefully the same list of files ...
```

If you don’t see the same files listed, something went wrong in the above steps.

If all is well, let’s start a connection to the database and run some SQL commands. Previously we specified a user named `system`, but this time, we’ll connect as user `sys`, for reasons we’ll explain later.

```sh
$ docker compose exec -it oracledb sqlplus sys/{% raw %}{{{% endraw %} your secure password }}@XEPDB1 as sysdba
```

Let’s take a moment to understand this command.

- `docker exec -it oracledb` tells the command to run inside the oracledb container, and to do so as an interactive terminal.
- `sqlplus` is the database client that comes built-in with the container.
- `sys/{% raw %}{{{% endraw %}your secure password}}@XEPDB1 as sysdba` is for authentication.
- We’re logging in as the user `sys`, because we found we couldn’t quite get the right privileges with system, even logging in `as sysdba`.
- We’re logging into the database XEPDB1. This stands for e<strong>X</strong>press <strong>E</strong>dition <strong>P</strong>luggable <strong>D</strong>ata<strong>B</strong>ase #<strong>1</strong>. Pluggable databases are an Oracle concept that is outside the scope of this article, but you can read [documentation on PDBs](https://docs.oracle.com/en/database/oracle/oracle-database/21/cncpt/CDBs-and-PDBs.html#GUID-49C0C90D-5A72-4131-8C3D-B07341C75CB2:~:text=User%20Accounts%22-,PDBs,-A%20PDB%20is).
- We’re logging in with the `sysdba` system privilege, which lets us do what Oracle calls “high-level administrative tasks — see [documentation on `sysdba` privileges](https://docs.oracle.com/cd/E17781_01/server.112/e18804/users_secure.htm#ADMQS215).

Now that we’re logged in, let’s run a quick SQL command. This will return the size in megabytes of the physical storage space taken up by the current database. It will probably be a relatively small number, since we haven’t added any data yet — we got 735 MB.

```sql
SELECT SUM(bytes)/1024/1024 size_in_mb FROM dba_data_files;
```
This may admittedly seem anticlimactic, just showing a number of megabytes, but it’s actually reason to celebrate — you’ve just set up an Oracle database using Docker! Congratulations!

Take a breath and get a glass of water. Once you’re ready, we’ll start importing data.

## Part 2: Importing data into your Oracle database

### Preparing to import data

Now that we have a database and we’re able to log in, it’s almost time to start adding data!

First, let’s ensure that the database can see our data import file. By default, the database doesn’t know much about the filesystem, and it doesn’t know anything about where our import file lives.

In order to let the database know about our file, we have to create a named directory, a special type of object in Oracle that gives us access to the filesystem.

```sql
CREATE DIRECTORY db_data AS '/db/data';
GRANT read ON DIRECTORY db_data TO system;
```

Let’s take a moment to understand this command.

The first line creates a directory object in the system called `db_data`, which we’ve chosen as the name since it mirrors the name of the container folder where our import file lives, `/db/data`.

The second line grants read permissions on this object to the user `system`. That way, when we log in as `system`, we’ll be able to access the contents of `/db/data` through the object `db_data`.

Exit the terminal by typing Control+D.

### Importing data, iteratively

Okay, now we're ready to start importing data, in iterations. Don't expect this to work the first time. We'll try to import, see what kinds of errors we get, and attempt to fix them one step — one iteration — at a time.

Frankly, we expect a number of data import problems to occur, and this tutorial may not be able to help you solve all of them. That said, we’ll explain what problems we figured out solutions to, so you can learn how to fix some problems and how you might approach any unique problems you encounter.

Let's add a command to our Docker Compose file, to make it easier to repeatedly re-run the import process. Edit `docker-compose.yml` as follows. Make sure this block is nested under (further right into) the `services` block.

```
docker-compose.yml
```
```diff
version: "3"

services:

+  oracledb: &oracledb
    image: container-registry.oracle.com/database/express:21.3.0-xe
    volumes:
      - ${FOLDER_WITH_IMPORT_FILE}:/db/data
      - oracle_data_volume:/opt/oracle/
    ports:
      - 1521:1521
+    expose:
+      - 1521
    environment:
      - ORACLE_PWD=${ORACLE_PASSWORD}

+  import:
+    <<: *oracledb
+    profiles: ["utilities"]
+    command: impdp ${ORACLE_USER}/${ORACLE_PASSWORD}@oracledb:1521/XEPDB1 directory=db_data dumpfile=${FILE_TO_IMPORT}

volumes:
  oracle_data_volume:

```

This is called a "profiled command". (See the `profiles:` key there?) Profiled commands are a Docker feature we learned from 18F member Andrew Dunkman. This allows us to run the one-off command `docker compose run import`. But, because we’ve given the command a profile, it doesn’t run by default when we run `docker compose up`. So we are in control of when this runs.

Let’s look at the command itself.

- `impdp` is the import data command for Oracle — it stands for “import data pump”.
- `system/{% raw %}{{{% endraw %}your secure password}}@XEPDB1` is for authentication. Note that this time, we’re not logging in as `sys` with `sysdba` administrative privileges. Why? Because we used the `sys` account to grant read access to `system`. We would have granted it to `sys` and kept things simple with one user, but we were told firmly in an error message that a user is not allowed to grant privileges to themselves.
- `directory=db_data` tells the database what directory to look for the file in. In the previous section, we created this `db_data` directory object, which allows the database to read from (and in our case, write to) the container’s `/db/data` directory.
- `dumpfile=${FILE_TO_IMPORT}` tells the import command which file in `/db/data/` to use. The filename should be in your .env file.

We also want to point out the addition of the YAML anchor. On line 5, we add an anchor `&oracledb` to the service name. This is a feature of YAML that lets us reference the `oracledb` service’s configuration without having to type it all out again. We’ll need this because these commands use the `sqlplus` client program that comes with the database image.

Lastly, we expose port 1521 internally — that allows the command to find the database.

Now we're ready to import! Go ahead and run:

```
$ docker compose run import
```

If your import ran, even if you got thousands of import errors — congratulations! You’re on your way to a working containerized Oracle database!

### Fixing common errors

#### Fixing missing users

Scan through the log messages that happened while you were importing. What kinds of errors are you noticing? Maybe write them down somewhere so you can troubleshoot later.

We’ll walk through the two main issues that we ran into: missing users and missing tablespaces.

The primary source of errors in our import was caused by missing users or roles. That is, many other errors occurred because privileges couldn’t be granted to users who didn’t exist in the database.

It’s possible this could be solved by adjusting the export to include users. In our case, however, we didn’t have this option, so we fixed it ourselves.

For every user the error log said was missing, we ran this block before re-trying the import.

```sql
create user {% raw %}{{{% endraw %} username }} identified by {% raw %}{{{% endraw %} a secure password }};
grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE to {% raw %}{{{% endraw %} username }};
```

Let’s break this down.

The first line creates the user and sets their password. The second grants a handful of permissions.

It took a few iterations to identify all of the missing users in the logs, but we eventually solved all the related errors by adding users, watching the logs for missing users, creating the missing users, and repeating.

#### Fixing missing tablespaces

The next set of errors related to missing tablespaces, the specific files on the filesystem where the data in the database is stored.

After some research and trial-and-error, we landed on an approach of manually creating “bigfile” tablespaces that started at 7 MB, estimated to be the minimum size.

```sql
CREATE BIGFILE TABLESPACE {% raw %}{{{% endraw %} tablespace name }} DATAFILE '{% raw %}{{{% endraw %} tablespace name }}.dbf' SIZE 7M AUTOEXTEND ON;
```

There may be a benefit to creating larger tablespaces up front, but we’re not sure this kind of optimization will be meaningful on databases this small.

#### Running fixes as a SQL file

After each iteration, we ended up putting all of the SQL commands we ran into a `setup.sql` file. That way, we wouldn’t have to re-encounter and re-solve all these problems when, say, a new contributor came onto the team and needed to set up a database copy.

Let’s also set up a one-off Docker Compose command to run the setup script. Add the below block to your docker-compose file, nested in two spaces so it's under `services`. The command will run a file `./db/data/setup.sql` on the Oracle database.

```
docker-compose.yml
```
```diff
version: "3"

services:

  oracledb: &oracledb
    image: container-registry.oracle.com/database/express:21.3.0-xe
    volumes:
      - ${FOLDER_WITH_IMPORT_FILE}:/db/data
      - oracle_data_volume:/opt/oracle/
    ports:
      - 1521:1521
    expose:
      - 1521
    environment:
      - ORACLE_PWD=${ORACLE_PASSWORD}

  import:
    <<: *oracledb
    profiles: ["utilities"]
    command: impdp ${ORACLE_USER}/${ORACLE_PASSWORD}@oracledb:1521/XEPDB1 directory=db_data dumpfile=${FILE_TO_IMPORT}

+  setup:
+    <<: *oracledb
+    profiles: ["utilities"]
+    command: bash -c 'cat /db/data/setup.sql | sqlplus ${ORACLE_USER}/${ORACLE_PASSWORD}@oracledb:1521/XEPDB1'

volumes:
  oracle_data_volume:

```

#### Clearing and re-running the import

If you’re not satisfied with an import and want to re-run it, we’ll have to get to a blank slate before trying it again. We run `docker compose down` and then use Docker Dashboard, the GUI application, to delete the volume.

To re-run the import, run `docker compose up` to start the database.

Then, in another terminal window, run `docker compose run setup` to run the fixes and preparatory steps in `setup.sql`.

After that finishes, run `docker compose run import` to import the data.


#### Confirming the import is complete

Once you’re satisfied that you’re not getting any critical errors when you import (though there may still be warnings), you can run a database console session to make sure the data looks good.

(At the end of our import process, we still had 1727 errors, mostly conversion errors and errors with setting up database constraints. Fortunately, we could ignore these, and were able to work with the data regardless.)

To log in and use the database console, run:

```sh
docker exec -it oracledb sqlplus system/{% raw %}{{{% endraw %} your secure password }}@XEPDB1
```

From here, you can start running SQL queries to determine whether the data you expect is in the database.

Note that this SQL client program doesn’t support common functions like tab-completion, history, and even navigating a line using left and right arrows. If you’re used to modern software development tools, this can be mildly frustrating to work with, so you may want to find another program to connect with and use as your query editor.

## Conclusion and summary instructions

Well done! You've set up an Oracle database and imported your data!

Here’s the final set of files and commands. Save .env and docker-compose.yml into the root of your project, then save setup.sql and any data exports you might have inside your data directory, which in our case was {project root}/db/data/. Fill out the values in {% raw %}{{{% endraw %} }} to match your setup.

```
.env
```
```sh
ORACLE_USER=system
ORACLE_PASSWORD={% raw %}{{{% endraw %} your secure password }}
IMPORT_FILE={% raw %}{{{% endraw %} name of the file to import, for example export.dmp }}
FOLDER_WITH_IMPORT_FILE={% raw %}{{{% endraw %} relative path to the folder containing the import file, for example ./db/data }}
```

```
docker-compose.yml
```
```yaml
version: "3"

services:

  oracledb: &oracledb
    image: container-registry.oracle.com/database/express:21.3.0-xe
    volumes:
      - ${FOLDER_WITH_IMPORT_FILE}:/db/data
      - oracle_data_volume:/opt/oracle/
    ports:
      - 1521:1521
    expose:
      - 1521
    environment:
      - ORACLE_PWD=${ORACLE_PASSWORD}

  setup:
    <<: *oracledb
    profiles: ["utilities"]
    command: bash -c 'cat /db/data/setup.sql | sqlplus ${ORACLE_USER}/${ORACLE_PASSWORD}@oracledb:1521/XEPDB1'

  import:
    <<: *oracledb
    profiles: ["utilities"]
    command: impdp ${ORACLE_USER}/${ORACLE_PASSWORD}@oracledb:1521/XEPDB1 directory=db_data dumpfile=${FILE_TO_IMPORT}

volumes:
  oracle_data_volume:

```

```
db/data/setup.sql
```
```sql
-- Set up permissions to access the dumpfile
CREATE directory db_data as '/db/data';
GRANT read on directory db_data to system;

-- Create users and roles
-- TODO: Fill in this template if you see errors about missing users during import. Otherwise, delete this section.
CREATE USER {% raw %}{{{% endraw %} username }}
  identified by {% raw %}{{{% endraw %} secure password }};

GRANT CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK,
  CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM,
  CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE,
  CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE
  to {% raw %}{{{% endraw %} username }};

CREATE USER {% raw %}{{{% endraw %} username 2 }}
  identified by {% raw %}{{{% endraw %} secure password 2 }};

GRANT CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK,
  CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM,
  CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE,
  CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE
  to {% raw %}{{{% endraw %} username 2 }};

-- Create tablespaces
-- TODO: Fill in this template if you see errors about missing tablespaces during import. Otherwise, delete this section.
CREATE BIGFILE TABLESPACE {% raw %}{{{% endraw %} tablespace name }}
  DATAFILE '{% raw %}{{{% endraw %} tablespace name }}.dbf'
  SIZE 7M AUTOEXTEND ON;

CREATE BIGFILE TABLESPACE {% raw %}{{{% endraw %} tablespace name 2 }}
  DATAFILE '{% raw %}{{{% endraw %} tablespace name 2 }}.dbf'
  SIZE 7M AUTOEXTEND ON;

```

Instructions:
- Set up the above files.
- Open a terminal window and run `docker compose up`.
- Open another terminal window, run `docker compose run setup`, then run `docker compose run import`.

## Special thanks

Special thanks to Eleni Chappen for working through database issues together, to Jason Nakai for doing a technical review of this post, to Amanda Costello for doing the plain-language review of this post, and to Alex Soble for his constant encouragement.
