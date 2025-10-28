#!/bin/bash

kubectl delete cluster pg-eu
kubectl patch cluster pg-us --type merge -p '{"spec":{"replica":{"enabled":false}}}'
