#!/bin/bash
# Clean up all completed backups in Kubernetes

# Namespace where your backups are stored (update if necessary)
NAMESPACE="default"

echo "Fetching completed backups in namespace: $NAMESPACE"

# Get the list of completed backup names
completed_backups=$(kubectl get backup -n "$NAMESPACE" --no-headers | awk '$5=="completed" {print $1}')

if [ -z "$completed_backups" ]; then
    echo "No completed backups found."
    exit 0
fi

echo "The following completed backups will be deleted:"
echo "$completed_backups"

# Confirm deletion
read -p "Proceed with deletion? (y/N): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    for backup in $completed_backups; do
        echo "Deleting backup: $backup ..."
        kubectl delete backup "$backup" -n "$NAMESPACE"
    done
    echo "✅ Cleanup complete."
else
    echo "❌ Deletion aborted."
fi
