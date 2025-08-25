#!/bin/bash

source ./config.sh

print_info "Install cnpg plugin\n"

print_command "curl -sSfL \
https://github.com/cloudnative-pg/cloudnative-pg/raw/main/hack/install-cnpg-plugin.sh | \
sh -s -- -b ${HOME}/cnpg\n"

curl -sSfL \
https://github.com/cloudnative-pg/cloudnative-pg/raw/main/hack/install-cnpg-plugin.sh | \
sh -s -- -b ${HOME}/cnpg

print_info "Pluging ${kubectl_cnp} installed\n"

if [[ "${os_platform}" == "Darwin" ]]
then
  echo "export PATH=${HOME}/cnpg:\${PATH}" >> ${HOME}/.zshrc
  print_info "\n${red}Please reload the environment variables by running:\n"
  print_command "\nsource ${HOME}/.zshrc\n"
elif [[ "${os_platform}" == "Linux" ]]
then
  echo "export PATH=${HOME}/cnpg:\${PATH}" >> ${HOME}/.bashrc
  print_info "\n${red}Please reload the environment variables by running:\n"
  print_command "\nsource ${HOME}/.bashrc\n"
fi
