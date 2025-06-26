#!/bin/bash

# Simulated rollback script

ENV=$1

echo "🔄 Simulating rollback for $ENV environment..."

if [ "$ENV" == "staging" ] || [ "$ENV" == "production" ]; then
  echo "🔙 This would rollback the $ENV environment on $ENV_SERVER"
else
  echo "❌ Unknown environment: $ENV"
  exit 1
fi

echo "✅ Rollback simulation completed for $ENV"
