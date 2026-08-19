#!/bin/bash

#git_directory=`git rev-parse --show-toplevel`
#. ${git_directory}/commands.sh

# ╭──────────────────────────────╮
# │        TMP directory         │
# ╰──────────────────────────────╯

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export TMP=${DIR}/tmp
[ -d $TMP ] || mkdir $TMP
source ./commands.sh

echo ""
echo "Find the YAML-files in $TMP"
echo ""

# ╭──────────────────────────────╮
# │        Set OS platform       │
# ╰──────────────────────────────╯

export os_platform=$(uname)
export k8s_tool="k3d" # valid options: "k3d" or "kind"
export k8s_cluster_name="cnpg-workshop"

# ╭──────────────────────────────╮
# │    Kubernetes environment    │
# ╰──────────────────────────────╯
#export namespace="edb-${region}-${id}"   # k8s namespace
export namespace="default"
export kubectl_cmd="kubectl"    # could be kubectl|oc
export kubectl_cnp="kubectl-cnpg"

# ╭──────────────────────────────╮
# │            Barman            │
# ╰──────────────────────────────╯

export cert_manager_version="v1.18.2"
export plugin_barman_version="v0.11.0"
export barman_object_name="object-store"
export barman_retention_policy="30d"

# local IP:
export os_platform=$(uname)
if [[ "${os_platform}" == "Darwin" ]]
then
   export local_ip=`ifconfig en0 inet | awk '/inet6/ {next} /inet/ {print $2}'`
elif [[ "${os_platform}" == "Linux" ]]
then
   #export local_ip=`hostname -I | awk '{print $1}'`
   export local_ip=$(ip route get 1 | awk '{print $7; exit}')
fi

# ╭──────────────────────────────╮
# │            Postgres          │
# ╰──────────────────────────────╯

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

# ╭──────────────────────────────╮
# │             EPAS             │
# ╰──────────────────────────────╯

export epas_image="docker.enterprisedb.com/k8s_enterprise/edb-postgres-advanced:17.2"
export epas_storage="512Mi"

# ╭──────────────────────────────╮
# │        Object Storage        │
# ╰──────────────────────────────╯

# Object Storage environment [minio|aws|azure]
export object_storage_type="minio"

if [ "$object_storage_type" = "minio" ]; then

  ## Minio
  export ACCESS_KEY_ID="admin"
  export ACCESS_SECRET_KEY="password"
  export ACCESS_SESSION_TOKEN=""
  export s3_bucket="backups"
  export minio_port=9000
  export local_ip=`ifconfig en0 inet | awk '/inet6/ {next} /inet/ {print $2}'`

  export object_storage_bucket="${bucket}"
  export s3_destination_path="s3://${bucket}/"
  #export s3_endpoint_url="https://minio-api-minio.apps.cluster-cx9nq.dynamic.redhatworkshops.io"
  #export s3_endpoint_url="https://<your-end-point>"
  export s3_endpoint_url="https://172.17.0.2:9000"

elif [ "$object_storage_type" = "aws" ]; then

  # Check variables to be completed...

  export s3_bucket="sergio1-bucket"
  export ACCESS_KEY=${AWS_ACCESS_KEY_ID}
  export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
  export AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN}
  export object_storage_bucket="${s3_bucket}"
  export s3_destination_path="s3://${s3_bucket}/"

elif [ "$object_storage_type" = "azure" ]; then

  if [[ -z "$CONTAINER_NAME" || -z "$RESOURCE_GROUP" || \
        -z "$AZURE_CONNECTION_STRING" || -z "$AZURE_STORAGE_ACCOUNT" ||\
        -z "$AZURE_STORAGE_KEY" || -z "$AZURE_STORAGE_SAS_TOKEN" \
     ]]; then
    echo "One or more variables are empty:"
    echo "    CONTAINER_NAME"
    echo "    RESOURCE_GROUP"
    echo "    AZURE_CONNECTION_STRING"
    echo "    AZURE_STORAGE_ACCOUNT"
    echo "    AZURE_STORAGE_KEY"
    echo "    AZURE_STORAGE_SAS_TOKEN"
    echo ""
    echo "Doc: https://cloudnative-pg.io/documentation/current/appendixes/object_stores/#azure-blob-storage"
    exit 1
  fi

  export CONTAINER_NAME="${CONTAINER_NAME}"
  export RESOURCE_GROUP="${RESOURCE_GROUP}"
  export AZURE_CONNECTION_STRING="${AZURE_CONNECTION_STRING}"
  export AZURE_STORAGE_ACCOUNT="${AZURE_STORAGE_ACCOUNT}"
  export AZURE_STORAGE_KEY="${AZURE_STORAGE_KEY}"
  export AZURE_STORAGE_SAS_TOKEN="${AZURE_STORAGE_SAS_TOKEN}"

  #<http|https>://<account-name>.<service-name>.core.windows.net/<resource-path>
  export s3_bucket="https://sergioalpheya.blob.core.windows.net/${CONTAINER_NAME}"

fi

# TDE used
# Not yet implemented
export use_tde="N" # Y|N
