#!/bin/bash

# credits to https://github.com/argoproj-labs/argocd-autopilot/issues/26

 kubectl create namespace argocd

kustomize build ../gitops/bootstrap/argo-cd | kubectl apply -f -
kubectl apply -f ../gitops/bootstrap/argo-cd.yaml
kubectl apply -f ../gitops/bootstrap/root.yaml
kubectl apply -f ../gitops/bootstrap/cluster-resources.yaml
kubectl -n argocd create secret generic autopilot-secret --from-literal git_username=username --from-literal git-token=ghp_...lPq
sleep 10
kubectl get secret argocd-initial-admin-secret -n argocd -ogo-template='{{printf "%s\n" (index (index . "data") "password" | base64decode)}}'