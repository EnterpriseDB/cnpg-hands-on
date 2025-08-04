#!/bin/bash

source ./config.sh

#version1=`kubectl-cnpg version | awk '{ print $2 }' | awk -F":" '{ print $2}'`
version1=`${kubectl_cnp} version | awk '{ print $2 }' | awk -F":" '{ print $2}'`
version2=${version1%??}
#version1=1.20.0
#version2=1.20
print_command "${kubectl_cmd} apply --server-side  --force-conflicts -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-${version2}/releases/cnpg-${version1}.yaml\n"

# Doc
echo 02 > ./docs/docid

${kubectl_cmd} apply --server-side  --force-conflicts -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-${version2}/releases/cnpg-${version1}.yaml
