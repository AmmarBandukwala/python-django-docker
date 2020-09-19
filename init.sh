#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

cd todo
echo "Current Working Folder ... " $PWD

echo "Update DB Schema ..."
python manage.py migrate
echo "Update DB Schema ... Done"

# Development
echo "Start Development Server ..."
python manage.py runserver 0.0.0.0:8000

# Production
# echo "Start GUNICORN Server ..."
# gunicorn todoapp.wsgi:application --bind 0.0.0.0:8000 --log-level debug