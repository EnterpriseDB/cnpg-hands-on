# CNPG demo

CNPG version tested is 1.27.1.

# Demo on MacOS and Linux prerequisites
If you want to test on MacOS (arm) or Linux (debian), these are the prerequisites:
- Docker
- k3d
- kubectl

# Demo on Azure prerequisites
If you want to test in Azure:
- Azure Kubernetes Service (AKS)
- az command line

# Azure variables configuration
```
export CONTAINER_NAME="<your-value>"
export RESOURCE_GROUP="<your-value>"
export AZURE_CONNECTION_STRING="<your-value>"
export AZURE_STORAGE_ACCOUNT="<your-value>"
export AZURE_STORAGE_KEY="<your-value>"
export AZURE_STORAGE_SAS_TOKEN="<your-value>"
export s3_bucket="https://<AZURE_STORAEG_ACCOUNT>.blob.core.windows.net/<CONTAINER_NAME>"
```

# Demo on AWS prerequisites
- Elastic Kubernetes Sercice (EKS)
- aws command line

## AWS variables configuration
```
export AWS_ACCESS_KEY_ID="<your-value>"
export AWS_SECRET_ACCESS_KEY="<your-value>"
export AWS_SESSION_TOKEN="<your-value>"
```

# Setup your object storage environment
Run this command and select one of these object storages:
```
./set_env.sh
Select the environment type:
1) minio (local Minio platform)
2) azure
3) aws
Enter choice [1-3]: 
```