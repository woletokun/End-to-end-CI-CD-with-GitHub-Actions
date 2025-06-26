#!/bin/bash

# Get the environment name from the argument
ENV=$1

# Check environment and run deployment accordingly
if [ "$ENV" == "staging" ]; then
  echo "Deploying to Staging..."
  scp -i "$STAGING_KEY" -r ./dist user@$STAGING_SERVER:/var/www/staging
elif [ "$ENV" == "production" ]; then
  echo "Deploying to Production..."
  scp -i "$PROD_KEY" -r ./dist user@$PROD_SERVER:/var/www/production
else
  echo "❌ Unknown environment: $ENV"
  exit 1
fi
