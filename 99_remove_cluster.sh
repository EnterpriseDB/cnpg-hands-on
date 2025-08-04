source ./config.sh

print_info "Stop k3d cluster\n"
print_command "k3d cluster delete\n"
k3d cluster delete

if [[ "${os_platform}" == "Darwin" ]]
then
   print_info "Stoping docker on MacOS\n"
   print_command "pkill docker\n"
   pkill docker
elif [[ "${os_platform}" == "Linux" ]]
then
   print_info "\nStop MinIO container\n"
   print_command "docker ps | grep minio | awk '{print $1}' | xargs -I % docker stop %\n"
   docker ps | grep minio | awk '{print $1}' | xargs -I % docker stop %
fi

print_info "Delete all yaml files\n"
print_command "rm -ef yaml/*\n"
rm -rf yaml/*
