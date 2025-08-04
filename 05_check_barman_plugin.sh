#!/bin/bash

source ./config.sh

print_info "Check the Installation of the Barman Plugin...\n"
print_command "${kubectl_cmd} rollout status deployment \
  -n cnpg-system barman-cloud\n"

${kubectl_cmd} rollout status deployment \
  -n cnpg-system barman-cloud

