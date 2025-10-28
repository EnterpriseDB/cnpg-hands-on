#!/bin/Bash

kubectl delete objectstores.barmancloud.cnpg.io object-storage-eu
kubectl delete objectstores.barmancloud.cnpg.io object-storage-us

kubectl delete cluster pg-eu
kubectl delete cluster pg-us

kubectl delete scheduledbackups pg-eu-backup
kubectl delete scheduledbackups pg-us-backup

