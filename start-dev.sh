#!/bin/sh
# Go to source code
cd source/
sudo chown nobody database/database.sqlite
sudo chown -R nobody storage/
cd ..

# Run the docker compose
docker compose -f docker-compose-dev.yaml up --build 
