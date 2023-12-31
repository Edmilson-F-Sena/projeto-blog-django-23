#!/bin/sh

# O shell irá encerrar a execução do script quando um comando falhar
set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  echo "waiting for Postgres Database Startup ($POSTGRES_HOST $POSTGRES_PORT) ..."
  sleep 0.1
  done

  echo "Postgres Database started Successfully ($POSTGRES_HOST:$POSTGRES_PORT)"
python manage.py collectstatic
python manage.py migrate
python manage.py runserver