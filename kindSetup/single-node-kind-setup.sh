#!/bin/bash

# credits to https://github.com/neumanndaniel/kubernetes/blob/master/kind/setup.sh

set -e

kind create cluster --config=single-node.yaml --name dev1

# Calico
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl apply -f ./calico-config.yaml

sleep 120

# Metrics Server
kubectl config set-context --current --namespace kube-system

helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade metrics-server --install \
--set apiService.create=true \
--set extraArgs.kubelet-insecure-tls=true \
--set extraArgs.kubelet-preferred-address-types=InternalIP \
bitnami/metrics-server --namespace kube-system

istioctl install -f install-istio.yaml -y

../autopilot/recover-from-repo.recover.sh
sleep 30
./private-container-image-registry.sh