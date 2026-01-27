#!/bin/bash

source ./config.sh

print_info "Create the Postgres Cluster using Cluster Image Catalog\n"
print_command "kubectl apply -f ${cluster_name}_using_image_catalog.yaml\n"
${kubectl_cmd} apply -f ./templates/ClusterImageCatalog.yaml
envsubst < ./templates/${cluster_name}-using-cluster-image-catalog.yaml | ${kubectl_cmd} apply -f- 
