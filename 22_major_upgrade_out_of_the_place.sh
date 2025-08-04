#!/bin/bash

source ./config.sh

envsubst < templates/${cluster_name}-major-upgrade-outofplace-template.yaml > yaml/${cluster_name}-major-upgrade-outofplace.yaml

print_info "Configuration:\n" 

cat yaml/${cluster_name}-major-upgrade-outofplace.yaml

sleep 10

print_command "${kubectl_cmd} apply -f yaml/${cluster_name}-major-upgrade-outofplace.yaml\n"

${kubectl_cmd} apply -f yaml/${cluster_name}-major-upgrade-outofplace.yaml
