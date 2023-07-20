#!/bin/bash

# Array of project names (folders)
projects=("infra" "images" "certificates" "app")

# Loop through the array of projects
for project in "${projects[@]}"; do
  # Navigate to project directory
  cd $project

  # Initialize terraform in the directory
  terraform init

  # Apply terraform
  terraform apply -auto-approve

  # Navigate back to the parent directory
  cd ..
done
