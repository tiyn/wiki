# kohakuhub – kohakuhub

This is a [Docker](/wiki/docker.md) container for a
[KohakuHub](https://github.com/KohakuBlueleaf/KohakuHub) server.
The Server consists of multiple Docker containers.
These are containers for the KohakuHub API and – depending on configuration – MinIO, LakeFS,
[Postgres](/wiki/docker/postgres.md)

## Setup

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
The file `docker-compose.yml` is usually created automatically.
For this first download the [repository](https://github.com/KohakuBlueleaf/KohakuHub).
Then run the following command to generate the `docker-compose.yml` file.

```sh
python scripts/generate_docker_compose.py
```

Alternatively the example file `docker-compose.example.yml` file can be copied.
An additional example can be found in the [corresponding section](#docker-composeyml).
Change the settings according to your needs and run `./rebuild.sh` afterward.

To publish the page on a domain the nginx container usually called `hub-ui` has to be published -
for example using a reverse proxy like
[traefik](/wiki/traefik.md#reverse-proxies-for-docker-service).

### Environment Variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.
There are many other environment variables, which are automatically generated and not listed here.

| Name | Usage | Default |
| ----------------------------------------- | ------------------------------------ | ------- |
| `KOHAKU_HUB_INVITATION_ONLY` | Will disable public registration | false |

### Volumes

There are some volumes, which are automatically generated and not listed here.

### Ports

There are no ports, which are exposed by default.

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker-compose up -d
```

### docker-compose.yml

```yml 
services:
  hub-ui:
    image: nginx:alpine
    restart: always
    volumes:
      – ./src/kohaku-hub-ui/dist:/usr/share/nginx/html
      – ./src/kohaku-hub-admin/dist:/usr/share/nginx/html-admin
      – ./docker/nginx/default.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      – hub-api
    
  hub-api:
    build: .
    restart: always
    depends_on:
      – postgres
      – lakefs
      – minio
    environment:
      – KOHAKU_HUB_INVITATION_ONLY=true
      – KOHAKU_HUB_BASE_URL=https://hub.sub.domain.tld
      – KOHAKU_HUB_S3_PUBLIC_ENDPOINT=https://s3.sub.domain.tld
      – KOHAKU_HUB_SESSION_SECRET=CHANGE_ME_SESSION_SECRET
      – KOHAKU_HUB_ADMIN_SECRET_TOKEN=CHANGE_ME_ADMIN_TOKEN
      – KOHAKU_HUB_DATABASE_KEY=CHANGE_ME_DATABASE_KEY
      – KOHAKU_HUB_DB_BACKEND=postgres
      – KOHAKU_HUB_DATABASE_URL=postgresql://user:password@postgres:5432/database
      – KOHAKU_HUB_S3_ENDPOINT=http://minio:9000
      – KOHAKU_HUB_S3_ACCESS_KEY=CHANGE_ME_S3_ACCESS_KEY
      – KOHAKU_HUB_S3_SECRET_KEY=CHANGE_ME_S3_SECRET_KEY
      – KOHAKU_HUB_S3_BUCKET=example-bucket
      – KOHAKU_HUB_S3_REGION=us-east-1
      – KOHAKU_HUB_LAKEFS_ENDPOINT=http://lakefs:28000
      – KOHAKU_HUB_LAKEFS_REPO_NAMESPACE=example
      – KOHAKU_HUB_SITE_NAME=ExampleHub
      – KOHAKU_HUB_AUTO_MIGRATE=true
    volumes:
      – ./hub-meta/hub-api:/hub-api-creds
  
  minio:
    image: quay.io/minio/minio:latest
    command: server /data --console-address ":29000"
    restart: unless-stopped
    environment:
      – MINIO_ROOT_USER=CHANGE_ME_MINIO_USER
      – MINIO_ROOT_PASSWORD=CHANGE_ME_MINIO_PASSWORD
    volumes:
      – ./hub-storage/minio-data:/data
      – ./hub-meta/minio-data:/root/.minio
  
  lakefs:
    build:
      context: ./docker/lakefs
    entrypoint: ["/bin/sh", "/scripts/lakefs-entrypoint.sh"]
    command: ["run"]
    restart: unless-stopped
    depends_on:
      – minio
      – postgres
    environment:
      – LAKEFS_DATABASE_TYPE=postgres
      – LAKEFS_DATABASE_POSTGRES_CONNECTION_STRING=postgres://user:password@postgres:5432/lakefs?sslmode=disable
      – LAKEFS_BLOCKSTORE_TYPE=s3
      – LAKEFS_BLOCKSTORE_S3_ENDPOINT=http://minio:9000
      – LAKEFS_BLOCKSTORE_S3_BUCKET=example-bucket
      – LAKEFS_BLOCKSTORE_S3_FORCE_PATH_STYLE=true
      – LAKEFS_BLOCKSTORE_S3_CREDENTIALS_ACCESS_KEY_ID=CHANGE_ME_S3_ACCESS_KEY
      – LAKEFS_BLOCKSTORE_S3_CREDENTIALS_SECRET_ACCESS_KEY=CHANGE_ME_S3_SECRET_KEY
      – LAKEFS_BLOCKSTORE_S3_REGION=us-east-1
      – LAKEFS_AUTH_ENCRYPT_SECRET_KEY=CHANGE_ME_LAKEFS_SECRET
      – LAKEFS_LISTEN_ADDRESS=0.0.0.0:28000
    volumes:
      – ./hub-meta/lakefs-data:/var/lakefs/data
      – ./hub-meta/lakefs-cache:/lakefs/data/cache
      – ./docker/lakefs/lakefs-entrypoint.sh:/scripts/lakefs-entrypoint.sh:ro
      – ./docker/lakefs/init-databases.sh:/scripts/init-databases.sh:ro
  
  postgres:
    image: postgres:15
    restart: always
    environment:
      – POSTGRES_USER=user
      – POSTGRES_PASSWORD=password
      – POSTGRES_DB=database
    volumes:
      – ./hub-meta/postgres-data:/var/lib/postgresql/data
```
