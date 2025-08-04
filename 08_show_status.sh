#!/bin/bash

source ./config.sh

#alias kg='/usr/local/bin/kubectl-cnpg'
#watch -c "kubectl-cnpg status cluster-example | tail -27"
#watch -c -n 5 "kubectl-cnpg status cluster-example | tail -20"
#watch -c -n 5 "kubectl-cnpg status cluster-example"

watch -c -n 5 "${kubectl_cnp} status ${cluster_name}"
