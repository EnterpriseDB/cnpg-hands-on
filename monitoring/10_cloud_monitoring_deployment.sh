#!/bin/bash

helm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts

sleep 2

helm upgrade --install \
  -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/kube-stack-config.yaml \
  prometheus-community \
  prometheus-community/kube-prometheus-stack \
  --wait --timeout 10m

sleep 2

kubectl get service prometheus-community-grafana -o yaml | \
sed -e "s/type: ClusterIP/type: LoadBalancer/" | \
kubectl apply -f -

sleep 10

kubectl get service prometheus-community-kube-prometheus -o yaml | \
sed -e "s/type: ClusterIP/type: LoadBalancer/" | \
kubectl apply -f -

sleep 10

#GRAFANA_IP=$(kubectl get svc prometheus-community-grafana -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
#PROMETHEUS_IP=$(kubectl get svc prometheus-community-kube-prometheus -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Wait for Grafana IP
while [ -z "$GRAFANA_IP" ] || [ "$GRAFANA_IP" = "<pending>" ]; do
  GRAFANA_IP=$(kubectl get svc prometheus-community-grafana -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  [ -z "$GRAFANA_IP" ] && [ "$GRAFANA_IP" != "<pending>" ] && echo "Waiting for Grafana IP..." && sleep 5
done

# Wait for Prometheus IP
while [ -z "$PROMETHEUS_IP" ] || [ "$PROMETHEUS_IP" = "<pending>" ]; do
  PROMETHEUS_IP=$(kubectl get svc prometheus-community-kube-prometheus -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  [ -z "$PROMETHEUS_IP" ] && [ "$PROMETHEUS_IP" != "<pending>" ] && echo "Waiting for Prometheus IP..." && sleep 5
done

echo ""
echo "***********************************************"
echo "Grafana User:     admin"
echo "Grafana Password: prom-operator"
echo "Grafana URL:      http://${GRAFANA_IP}"
echo "***********************************************"
echo ""
echo "***********************************************"
echo "Prometheus URL:   http://${PROMETHEUS_IP}:9090"
echo "***********************************************"
echo ""
echo "***********************************************"
echo "Import Dashboard in Grafana: https://github.com/cloudnative-pg/grafana-dashboards/blob/main/charts/cluster/grafana-dashboard.json"
echo "***********************************************"
