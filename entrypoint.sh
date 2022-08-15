#!/bin/bash

echo "Waiting for database start"
until curl --http0.9 http://"${DATABASE_HOST}":"${DATABASE_PORT}"; do
  sleep 1
done

echo "Applying database migrations"
python manage.py migrate

echo "Creating superuser"
python manage.py createsuperuser --noinput


echo "Starting server on 0.0.0.0:8000"
python manage.py runserver 0.0.0.0:8000
