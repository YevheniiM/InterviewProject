#!/bin/bash

echo "Waiting for postgres..."
while ! nc -z database 5432; do
  sleep 5
done
echo "postgres is ready..."

# shellcheck disable=SC2164
cd interview_project/

python manage.py migrate || {
  echo 'migration has been failed'
  exit 1
}
python manage.py collectstatic --no-input || {
  echo 'static collection has been failed'
  exit 1
}
python manage.py runserver 0.0.0.0:8000 || {
  echo 'server start has been failed'
  exit 1
}

exec "$@"