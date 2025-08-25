#!/bin/bash

source ./config.sh

#Doc
echo "10" > ./docs/docid

print_command "${kubectl_cmd} delete -f ./yaml/backup.yaml\n"
${kubectl_cmd} delete  -f $TMP/backup.yaml > /dev/null 2>&1 

envsubst < templates/backup-template.yaml > $TMP/backup.yaml

print_info "Displaying the backup.yaml file...\n"
cat $TMP/backup.yaml
sleep 5

print_command "${kubectl_cmd} apply -f $TMP/backup.yaml\n"
${kubectl_cmd} apply -f $TMP/backup.yaml

