#!/bin/bash

source ./config.sh

print_info  "\nInstallation Cert-Manager...\n"

print_command "${kubectl_cmd} apply -f \
  https://github.com/cert-manager/cert-manager/releases/download/${cert_manager_version=}/cert-manager.yaml\n"

${kubectl_cmd} apply -f \
  https://github.com/cert-manager/cert-manager/releases/download/${cert_manager_version=}/cert-manager.yaml

i=10

while [ $i -gt 0 ]
do
   print_info "waiting $i seconds...\n"
   i=`expr ${i} - 5`
   sleep 5
done

print_info  "Installation Barman-Plugin...\n"

print_command "${kubectl_cmd} apply -f \
        https://github.com/cloudnative-pg/plugin-barman-cloud/releases/download/${plugin_barman_version}/manifest.yaml\n"

${kubectl_cmd} apply -f \
        https://github.com/cloudnative-pg/plugin-barman-cloud/releases/download/${plugin_barman_version}/manifest.yaml

print_info "Create the MinIO Secret...\n"

print_command "${kubectl_cmd} create secret generic minio-creds \
  --from-literal=MINIO_ACCESS_KEY=${ACCESS_KEY_ID} \
  --from-literal=MINIO_SECRET_KEY=${ACCESS_SECRET_KEY}\n"

${kubectl_cmd} create secret generic minio-creds \
  --from-literal=MINIO_ACCESS_KEY=${ACCESS_KEY_ID} \
  --from-literal=MINIO_SECRET_KEY=${ACCESS_SECRET_KEY}

print_info "Create the Object Store Configuration \n"
envsubst < templates/minio-template.yaml > $TMP/minio.yaml
#export ip=`ifconfig en0 inet | awk '/inet6/ {next} /inet/ {print $2}'`
#sed -i 's/#IP#/'${ip}'/' yaml/minio.yaml

print_info "Configuration:\n"
cat $TMP/minio.yaml

sleep 5

print_command "${kubectl_cmd} create apply -f yaml/minio.yaml\n"

${kubectl_cmd} apply -f $TMP/minio.yaml
