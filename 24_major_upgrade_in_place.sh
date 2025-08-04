#!/bin/bash

source ./config.sh

envsubst < templates/${cluster_name}-major-upgrade-inplace-template.yaml > yaml/${cluster_name}-major-upgrade-inplace.yaml

clear
print_command "diff -a --suppress-common-lines -y yaml/${cluster_name}-minor-upgrade.yaml yaml/${cluster_name}-major-upgrade-inplace.yaml\n"
diff -a --suppress-common-lines -y yaml/${cluster_name}-minor-upgrade.yaml yaml/${cluster_name}-major-upgrade-inplace.yaml

sleep 5

print_command "${kubectl_cmd} apply -f yaml/${cluster_name}-major-upgrade-inplace.yaml\n"

${kubectl_cmd} apply -f yaml/${cluster_name}-major-upgrade-inplace.yaml
