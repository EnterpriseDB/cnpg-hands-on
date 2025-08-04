#!/bin/bash

source ./config.sh

print_command "${kubectl_cnp} pgadmin4 ${cluster_name} -n default\n"

${kubectl_cnp} pgadmin4 ${cluster_name} -n default
