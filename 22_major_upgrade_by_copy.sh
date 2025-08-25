#!/bin/bash

source ./config.sh

envsubst < templates/${cluster_name}-major-upgrade-by-copy.yaml > $TMP/${cluster_name}-major-upgrade-by-copy.yaml

print_info "Configuration:\n" 

cat $TMP/${cluster_name}-major-upgrade-by-copy.yaml

print_command "${kubectl_cmd} apply -f $TMP/${cluster_name}-major-upgrade-by-copy.yaml\n"

${kubectl_cmd} apply -f $TMP/${cluster_name}-major-upgrade-by-copy.yaml
