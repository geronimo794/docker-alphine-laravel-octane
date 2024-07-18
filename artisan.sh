#!/bin/sh

# Php artisan calling
command="artisan $@"

# Change the folder to nobody first
sudo chown -R nobody source/database/migrations

# Change by container name to migrate
# Use: docker ps or use portainer
sudo docker exec -it documess_web_service.1.y6fyforjwrrqz2j1cga9asa16 /usr/bin/php $command

# Change the ownership of the database folder files to current user
CURRENT_USER=$(eval "whoami")
CURRENT_GROUP=$(eval "id -gn")

# Add needed change ownership of file
sudo chown -R $CURRENT_USER:$CURRENT_GROUP source/database/migrations