#!/bin/bash

CONFIG_FILE="config.sh"

# Check if config.sh exists
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "❌ Error: $CONFIG_FILE not found!"
  exit 1
fi

# Prompt user for environment
echo "Select the environment type:"
echo "1) minio (local Minio platform)"
echo "2) azure"
echo "3) aws"
read -p "Enter choice [1-3]: " choice

case $choice in
  1) env_type="minio" ;;
  2) env_type="azure" ;;
  3) env_type="aws" ;;
  *) echo "❌ Invalid choice. Please run the script again."; exit 1 ;;
esac

# Detect OS and pick correct sed command
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS (BSD sed)
  if grep -q "^export object_storage_type=" "$CONFIG_FILE"; then
    sed -i '' "s/^export object_storage_type=.*/export object_storage_type=\"$env_type\"/" "$CONFIG_FILE"
  else
    echo "export object_storage_type=\"$env_type\"" >> "$CONFIG_FILE"
  fi
else
  # Linux (GNU sed)
  if grep -q "^export object_storage_type=" "$CONFIG_FILE"; then
    sed -i "s/^export object_storage_type=.*/export object_storage_type=\"$env_type\"/" "$CONFIG_FILE"
  else
    echo "export object_storage_type=\"$env_type\"" >> "$CONFIG_FILE"
  fi
fi

echo "✅ Environment set to: $env_type"
echo "Updated $CONFIG_FILE successfully."
