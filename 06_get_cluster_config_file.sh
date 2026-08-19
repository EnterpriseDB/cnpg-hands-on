#!/bin/bash

source ./config.sh

envsubst < templates/${object_storage_type}-template.yaml > $TMP/${object_storage_type}-storage.yaml
envsubst < templates/${cluster_name}-template.yaml > $TMP/${cluster_name}.yaml

echo ""
print_info "Please, run this command:\n"
print_command "cat $TMP/${object_storage_type}-storage.yaml\n"
print_command "cat $TMP/${cluster_name}.yaml\n"
echo ""

