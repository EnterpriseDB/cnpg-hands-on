#!/bin/bash

source ./config.sh

# Doc
echo 12 > ./docs/docid

print_command "Displaying the restore.yaml file...\n"
envsubst < templates/restore-template.yaml > yaml/restore.yaml
cat yaml/restore.yaml
sleep 5

print_command "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql ${cluster_name}\n"
print_command "kubectl apply -f restore.yaml\n"

#kubectl exec -it cluster-example-2 -- psql -c "select pg_switch_wal();"
#echo "select pg_switch_wal()" | kubectl-cnpg psql cluster-example
#sleep 3

${kubectl_cmd} apply -f yaml/restore.yaml
