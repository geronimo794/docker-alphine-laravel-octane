#!/bin/sh
cd source/
sudo chown nobody database/database.sqlite
sudo chown -R nobody storage/

cd ..
docker compose -f docker-compose.yaml up --build
