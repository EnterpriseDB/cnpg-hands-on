#!/bin/bash

source ./config.sh

print_info "Check docker running?\n"

print_command "docker ps > /dev/null 2>&1\n"

docker ps > /dev/null 2>&1 
if [ $? -ne 0 ]
then
  print_info "Docker is not running\n"
  if [[ "${os_platform}" == "Darwin" ]]
  then
     print_info "Starting docker on MacOS\n"
     print_command "open -a docker\n"
     open -a docker
     i=15
     while [ $i -gt 0 ]
     do
       print_command "${yellow}Docker will be started in $i seconds\n"
       i=`expr ${i} - 5`
       sleep 5
       #i=$b
     done
   fi
else
   print_info "Docker is running...\n"
fi

print_info "Starting $k8s_tool cluster\n"

case $k8s_tool in
	k3d)
		$k8s_tool cluster delete $k8s_cluster_name
		$k8s_tool cluster create $k8s_cluster_name
		;;
	kind)
		$k8s_tool delete cluster --name $k8s_cluster_name
		$k8s_tool create cluster --name $k8s_cluster_name
		;;
	*)
		echo "Invalid k8s_tool options. Exiting"
		exit -1
		;;
esac

print_info "\nInstalling prometheus...\n"
print_command "\nhelm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts\n"

helm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts

print_command "\nhelm upgrade --install \
  -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/kube-stack-config.yaml \
  prometheus-community \
  prometheus-community/kube-prometheus-stack\n"

helm upgrade --install \
  -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/kube-stack-config.yaml \
  prometheus-community \
  prometheus-community/kube-prometheus-stack

print_info "\n\n${red}Please run './start_minio_docker_server.sh &' in a new terminal before proceeding!\n"
