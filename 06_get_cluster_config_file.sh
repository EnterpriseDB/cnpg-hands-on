#!/bin/bash

source ./config.sh

# Doc
echo 06 > ./docs/docid

envsubst < templates/${cluster_name}-template.yaml > $TMP/${cluster_name}.yaml

print_command "cat $TMP/${cluster_name}.yaml\n"
cat $TMP/${cluster_name}.yaml

