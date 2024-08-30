#!/bin/bash

CONTAINER_NAME="test_db"

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Start the PostgreSQL container
docker run -d --name $CONTAINER_NAME -p 5433:5432 \
  -e POSTGRES_USER=staff_user \
  -e POSTGRES_PASSWORD=staff_password \
  -e POSTGRES_DB=db \
  -v ./test_initdb.sql:/docker-entrypoint-initdb.d/initdb.sql \
  postgres:15.1

# Wait for the PostgreSQL container to be up and running
sleep 2

cd ../server

# Run pytest
DB_HOST=localhost DB_PORT=5433 DB_USERNAME=staff_user DB_PASSWORD=staff_password DB_DATABASE=db py.test -vv

# # Stop and remove the PostgreSQL container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME