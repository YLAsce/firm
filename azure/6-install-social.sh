#!/bin/bash
# bug in sed command: sed: 1: "../benchmarks/1-social- ...": invalid command code . need to run manual
KUBE_DNS_CLUSTER_IP=$(kubectl get service -n kube-system kube-dns -o yaml | grep "clusterIP:" | awk '{print $2}')
echo ${KUBE_DNS_CLUSTER_IP}

#sed -i "s/10.0.0.10/${KUBE_DNS_CLUSTER_IP}/g"  ../benchmarks/1-social-network/nginx-web-server/conf/nginx-k8s.conf
#sed -i "s/10.0.0.10/${KUBE_DNS_CLUSTER_IP}/g"  ../benchmarks/1-social-network/media-frontend/conf/nginx-k8s.conf
#Here the firm should be installed at /home/azureuser dir

kubectl apply -f ../benchmarks/1-social-network/k8s-yaml/social-network-ns.yaml
kubectl apply -f ../benchmarks/1-social-network/k8s-yaml/
kubectl -n social-network get pod


# construct social network, omitted here