#!/bin/bash
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=ghp_pW31V --docker-email=manu-mishra
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=ghp_pW31V --docker-email=manu-mishra -n development
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=ghp_pW31V --docker-email=manu-mishra -n stage
kubectl create secret docker-registry private-repo-secret --docker-server=https://ghcr.io --docker-username=manu-mishra --docker-password=ghp_pW31V --docker-email=manu-mishra -n production