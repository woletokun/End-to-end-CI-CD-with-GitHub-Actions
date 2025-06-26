#!/bin/bash

# Simulated deployment script (training version)

ENV=$1

echo "Simulating deployment to $ENV environment..."

if [ "$ENV" == "staging" ]; then
  echo "✅ This would deploy to STAGING at $STAGING_SERVER using $STAGING_KEY"
elif [ "$ENV" == "production" ]; then
  echo "✅ This would deploy to PRODUCTION at $PROD_SERVER using $PROD_KEY"
else
  echo "❌ Unknown environment: $ENV"
  exit 1
fi

echo "🎉 Deployment simulation complete for $ENV"
