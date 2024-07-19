#!/bin/sh

# Php artisan calling
command="artisan $@"

# Change the folder to nobody first
sudo chown -R nobody source/database/migrations

# Change by container name to migrate
# Use: docker ps or use portainer
sudo docker exec -it 8e1907e4e5be5afb6276c60f4a6311519b8160520ef3af09d027dfc6e80a88d9 /usr/bin/php $command

# Change the ownership of the database folder files to current user
CURRENT_USER=$(eval "whoami")
CURRENT_GROUP=$(eval "id -gn")

# Add needed change ownership of file
sudo chown -R $CURRENT_USER:$CURRENT_GROUP source/database/migrations