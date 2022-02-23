#!/bin/bash

kubectl delete secret docker-registry private-repo-secret
kubectl delete secret docker-registry private-repo-secret -n development
kubectl delete secret docker-registry private-repo-secret -n stage
kubectl delete secret docker-registry private-repo-secret -n production
kubectl delete secret docker-registry private-repo-secret -n operations

kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=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 --docker-email=manu-mishra
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=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 --docker-email=manu-mishra -n development
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=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 --docker-email=manu-mishra -n stage
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=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 --docker-email=manu-mishra -n production
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=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 --docker-email=manu-mishra -n operations