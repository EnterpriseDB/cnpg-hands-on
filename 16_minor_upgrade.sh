#!/bin/bash

source ./config.sh

envsubst < templates/${cluster_name}-minor-upgrade-template.yaml > $TMP/cluster-example-minor-upgrade.yaml

clear
print_info "diff -a --suppress-common-lines -y yaml/${cluster_name}.yaml $TMP/cluster-example-minor-upgrade.yaml\n"
diff -a --suppress-common-lines -y $TMP/${cluster_name}.yaml $TMP/cluster-example-minor-upgrade.yaml

sleep 2

print_info  "Upgrading the Postgres Cluster...\n"
print_command "${kubectl_cmd} apply -f $TMP/${cluster_name}-minor-upgrade.yaml\n"

${kubectl_cmd} apply -f $TMP/${cluster_name}-minor-upgrade.yaml
