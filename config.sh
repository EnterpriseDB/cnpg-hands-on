#!/bin/bash

#git_directory=`git rev-parse --show-toplevel`
#. ${git_directory}/commands.sh

source ./commands.sh

export TMP=/tmp/cnpg-files
[ -d $TMP ] || mkdir $TMP
echo "Find the YAML-files in $TMP"

#set OS platform
export os_platform=$(uname)

# Variables to be replaced
#export id="$(oc whoami)"          # your name or id
#export region="emea"              # emea,na,apj
#export bucket="backups"           # S3 bucket name

# Kubernetes environment
#export namespace="edb-${region}-${id}"   # k8s namespace
export kubectl_cmd="kubectl"	# could be kubectl|oc
export kubectl_cnp="kubectl-cnpg"

# Barman
export cert_manager_version="v1.18.2"
export plugin_barman_version="v0.5.0"
export barman_object_name="minio-store"
export barman_retention_policy="30d"

# local IP:
export os_platform=$(uname)
if [[ "${os_platform}" == "Darwin" ]]
then
   export local_ip=`ifconfig en0 inet | awk '/inet6/ {next} /inet/ {print $2}'`
elif [[ "${os_platform}" == "Linux" ]]
then
   export local_ip=`hostname -I | awk '{print $1}'`
fi

# Postgres
export cluster_name="cluster-example"
export cluster_restore="cluster-restore"
export cluster_major_upgrade="cluster-example-17"
export postgres_instances=3
export postgres_cpu="0.5"
export postgres_max_cpu="0.5"
export postgres_memory="512Mi"
export postgres_max_memory="512Mi" # "1Gi"
export postgres_storage="512Mi"
export postgres_wal_storage="512Mi"
export postgres_idx_storage="512Mi"
export postgres_tmp_storage="512Mi"
export postgres_idx_storage="512Mi"
export postgres_default_image="quay.io/enterprisedb/postgresql:16.4"
export postgres_minor_upgrade_image="quay.io/enterprisedb/postgresql:16.5"
export postgres_major_upgrade_image="quay.io/enterprisedb/postgresql:17"

# EPAS
export epas_image="docker.enterprisedb.com/k8s_enterprise/edb-postgres-advanced:17.2"
export epas_storage="512Mi"

# Object Storage environment [minio|aws]
export object_storage_type="minio"
export ACCESS_KEY_ID="admin"
export ACCESS_SECRET_KEY="password"
export ACCESS_SESSION_TOKEN=""
export s3_bucket="backups"
#export s3_destination_path="s3://${bucket}/"
export minio_port=9000
export local_ip=`ifconfig en0 inet | awk '/inet6/ {next} /inet/ {print $2}'`

## S3
#export object_storage_type="aws"
#export object_storage_bucket="${bucket}"
#export s3_destination_path="s3://${bucket}/"

## Minio
export object_storage_bucket="${bucket}"
export s3_destination_path="s3://${bucket}/"
export s3_endpoint_url="https://minio-api-minio.apps.cluster-cx9nq.dynamic.redhatworkshops.io"

# TDE used
# Not yet implemented
export use_tde="N" # Y|N
