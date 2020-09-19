# Python-Django ToDo App

This repo contains a basic Django application stack that can be deploy locally with docker container.

## Prerequisites

- Docker: Containerization and Deployment
- Python 3.x: Language Framework

## Get Running

> Clone the Repository

```bash
git clone {repository url}
```

> Spin up Containers, Go to Root Folder with docker-compose.yml

```bash
docker-compose up --build
```

> Browse Services (Verify Containers Running)

Note: 127.0.0.1 (Loop Back Address)

```text
http://127.0.0.1:5050/ #pgAdmin Web Site
http://127.0.0.1:8000/ #todo Web Site
http://127.0.0.1:5432/ #Postgres Database
```

> Create Django Super User for Admin Screen

```bash
docker ps # get container id of todo
```

```bash
docker exec {containerid} -it /bin/bash
cd todo
python manage.py createsuperuser
```

> Login

```text
http://127.0.0.1:5050/admin # Login with your credentials, click on categories, and generate some dummy data
```

> Add Database Server via pgAdmin Web Site

1. Login to the pgAdmin portal at 127.0.0.1:5050
   - The user name and password are set in the environment variable within the docker-compose file.
2. Right click servers and go to 'create server'
3. Click the 'connection' tab
   - HOST should be your machine ip address, in windows go to command line and run ipconfig.
   - PORT should be the default unless changed 5432
   - DATABASE/USER/PASSWORD should all be 'postgres' unless overridden in docker-compose file.