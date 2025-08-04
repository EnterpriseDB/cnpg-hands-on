#!/bin/bash

source ./config.sh 
source ./replica.sh

i=$1
case $i in
  "on")
    print_command "${kubectl_cnp} fencing ${i} ${cluster_name} ${replica}\n"
    ${kubectl_cnp} fencing on ${cluster_name} ${replica}
    ;;
  "off")
    print_command "${kubectl_cnp} fencing ${i} ${cluster_name} ${replica}\n"
    ${kubectl_cnp} fencing ${i} ${cluster_name} ${replica}
    ;;
  *)
    print_command "Wrong argument"
    exit
esac
