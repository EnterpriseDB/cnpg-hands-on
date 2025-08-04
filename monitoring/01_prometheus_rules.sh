#!/bin/bash
. ../config.sh
printf "${green}kubectl apply -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/cnpg-prometheusrule.yaml${reset}\n"

#kubectl apply -f \
#  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/cnpg-prometheusrule.yaml
kubectl apply -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/prometheusrule.yaml

#kubectl apply -f `pwd`/cnpg_prometheusrule.yaml

kubectl get prometheusrules
