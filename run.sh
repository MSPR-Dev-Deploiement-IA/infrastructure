#!/bin/bash

cd ./infra
terraform init
terraform apply -auto-approve
terraform output -json > ./config.json

cd ../images
cp ../infra/config.json .
terraform init
terraform apply -auto-approve || true

cd ../certificates
cp ../infra/config.json .
terraform init
terraform apply -auto-approve

cd ../app
cp ../infra/config.json .
terraform init
terraform apply -auto-approve