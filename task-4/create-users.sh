#!/bin/bash

USERS=("user1" "user2" "user3")
GROUPS=("qa" "managers" "analytics" "developers" "devops")

for USER in "${USERS[@]}"; do
  openssl genrsa -out $USER.key 2048
  openssl req -new -key $USER.key -out $USER.csr -subj "/CN=$USER"
  openssl x509 -req -in $USER.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key \
    -CAcreateserial -out $USER.crt -days 365
done
