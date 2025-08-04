#!/bin/bash

source ./config.sh
source ./replica.sh

print_command "${kubectl_cnp} promote ${cluster_name} ${replica}\n"

${kubectl_cnp} promote ${cluster_name} ${replica}
