#!/bin/bash

source ./config.sh

#Doc
echo "10" > ./docs/docid

print_command "${kubectl_cmd} delete -f ./yaml/backup.yaml\n"
${kubectl_cmd} delete  -f backup.yamla> /dev/null 2>&1 

envsubst < templates/backup-template.yaml > yaml/backup.yaml

print_info "Displaying the backup.yaml file...\n"
cat yaml/backup.yaml
sleep 5

print_command "${kubectl_cmd} apply -f yaml/backup.yaml\n"
${kubectl_cmd} apply -f yaml/backup.yaml

#print_command "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql ${cluster_name}\n"
#echo "select pg_switch_wal();" | ${kubectl_cnp} psql ${cluster_name}
