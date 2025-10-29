#!/bin/Bash

kubectl apply --server-side  --force-conflicts -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.27/releases/cnpg-1.27.1.yaml
