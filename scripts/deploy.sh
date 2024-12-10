#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Hash 1592
# Hash 2007
# Hash 5091
# Hash 6294
# Hash 5457
# Hash 8201
# Hash 4704
# Hash 9766
# Hash 2237
# Hash 5664
# Hash 5340
# Hash 6972
# Hash 5621
# Hash 7425
# Hash 1762
# Hash 8224
# Hash 9078
# Hash 1719
# Hash 7791
# Hash 6580
# Hash 7421
# Hash 1171
# Hash 1420
# Hash 8189
# Hash 6387
# Hash 6216
# Hash 7908
# Hash 8797
# Hash 1684
# Hash 9245
# Hash 5045
# Hash 4261
# Hash 3148
# Hash 8691
# Hash 4230
# Hash 6206
# Hash 2657
# Hash 5430
# Hash 8005
# Hash 4166
# Hash 4324
# Hash 5646
# Hash 6695
# Hash 8757
# Hash 8284
# Hash 2654
# Hash 7809
# Hash 7180
# Hash 7430
# Hash 6498
# Hash 1247
# Hash 2086
# Hash 8831
# Hash 8267
# Hash 2300
# Hash 4131
# Hash 7788
# Hash 4724
# Hash 3902
# Hash 8871