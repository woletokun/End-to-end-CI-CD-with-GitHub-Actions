#!/bin/bash

# Get environment as argument
ENV=$1

echo "Rolling back environment: $ENV"

# Replace with logic for reverting to a backup or previous release
# For demonstration, simulate a rollback command
ssh user@${ENV}_SERVER "cd /var/www/$ENV && ./rollback-to-last-known-good.sh"
