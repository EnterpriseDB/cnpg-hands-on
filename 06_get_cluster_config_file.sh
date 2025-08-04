#!/bin/bash

source ./config.sh

# Doc
echo 06 > ./docs/docid

envsubst < templates/${cluster_name}-template.yaml > yaml/${cluster_name}.yaml

print_command "cp templates/${cluster_name}-template.yaml yaml/${cluster_name}.yaml\n"
print_command "cat yaml/${cluster_name}.yaml\n"

cat yaml/${cluster_name}.yaml

