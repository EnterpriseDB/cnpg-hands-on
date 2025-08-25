#!/bin/bash

source ./config.sh

print_info "Create the Postgres Cluster\n"
print_command "kubectl apply -f ${cluster_name}.yaml\n"

${kubectl_cmd} apply -f $TMP/${cluster_name}.yaml
