#!/bin/bash

# credits to https://github.com/neumanndaniel/kubernetes/blob/master/kind/setup.sh

set -e
docker network inspect -f '{{.IPAM.Config}}' kind

kind create cluster --name dev1


# Metrics Server
kubectl config set-context --current --namespace kube-system

helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade metrics-server --install \
--set apiService.create=true \
--set extraArgs.kubelet-insecure-tls=true \
--set extraArgs.kubelet-preferred-address-types=InternalIP \
bitnami/metrics-server --namespace kube-system

# Metallb Server
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml
kubectl get pods -n metallb-system

kubectl apply -f ./metallb-configmap.yaml
