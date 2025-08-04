#!/bin/bash

source ./config.sh

# Doc
echo 03 > ./docs/docid

print_command "${kubectl_cmd} get deploy -n cnpg-system cnpg-controller-manager\n"

${kubectl_cmd} get deploy -n cnpg-system cnpg-controller-manager -o wide

