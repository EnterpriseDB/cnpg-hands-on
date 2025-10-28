#!/bin/Bash

cd ..
source ./config.sh
cd -

# EU
kubectl delete objectstores.barmancloud.cnpg.io object-storage-eu
envsubst < ../templates/dr/azure-object-storage-eu.yaml > ./tmp/object-storage-eu.yaml
kubectl apply -f ./tmp/object-storage-eu.yaml
sleep 2
rm -f ./tmp/pg-eu.yaml
envsubst < ../templates/dr/pg-eu.yaml > ./tmp/pg-eu.yaml
kubectl apply -f ./tmp/pg-eu.yaml
kubectl  wait --timeout=30m --for=condition=Ready cluster/pg-eu

# US
kubectl delete objectstores.barmancloud.cnpg.io object-storage-us
envsubst < ../templates/dr/azure-object-storage-us.yaml > ./tmp/object-storage-us.yaml
kubectl apply -f ./tmp/object-storage-us.yaml
sleep 2
rm -f ./tmp/pg-us.yaml
envsubst < ../templates/dr/pg-us.yaml > ./tmp/pg-us.yaml
kubectl apply -f ./tmp/pg-us.yaml
