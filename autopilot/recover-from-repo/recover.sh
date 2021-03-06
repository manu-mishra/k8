#!/bin/bash

# credits to https://github.com/argoproj-labs/argocd-autopilot/issues/26

kubectl create namespace argocd

kustomize build ../gitops/bootstrap/argo-cd | kubectl apply -f -
kubectl apply -f ../gitops/bootstrap/argo-cd.yaml
kubectl wait --for=condition=available --timeout=6s deployment.apps/argocd-server -n argocd
kubectl -n argocd create secret generic autopilot-secret --from-literal git_username=username --from-literal git-token=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
kubectl apply -f ../gitops/bootstrap/cluster-resources.yaml
kubectl apply -f ../gitops/bootstrap/operations-root.yaml
#kubectl get secret argocd-initial-admin-secret -n argocd -ogo-template='{{printf "%s\n" (index (index . "data") "password" | base64decode)}}'
kubectl apply -f ../gitops/bootstrap/app-root.yaml

