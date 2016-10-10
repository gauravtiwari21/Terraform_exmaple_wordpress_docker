#!/bin/bash -e

# TODO Add named arg parsing and error handling

APP="$1"
ENV="$2"
COUNT="$3"
SIZE="$4"
region="us-east-1"

terraform apply -var "access_key=${AWS_ACCESS_KEY}" -var "secret_key=${AWS_SECRET}" -var 'region=us-east-1' -var "aws_key_pair_path=${AWS_KEY_PATH}" -var "aws_key_pair_name=${AWS_KEY_PAIR_NAME}" -var "db_username=${DB_USERNAME}" -var "db_password=${DB_PASSWORD}" -var "app_name=${APP}" -var "environment=${ENV}" -var "instance_type=${SIZE}" -var "count=${COUNT}"

# PREPARE VARS TO RUN ANSIBLE PLAYBOOK
export terraform_inventory=$(which terraform-inventory)
export PUBLIC_ACCESS_POINT=$(terraform output | grep App_entrypoint_address | cut -d = -f2)
export DB_URL=$(cat terraform.tfstate | grep endpoint | cut -d : -f2- | tr -d '"' | tr -d , | tr -d ' ')  # This is the RDS acess endpoint 
export ansible_params="DB_HOST=${DB_URL} DB_USER=${DB_USERNAME} -var DB_PASS=${DB_PASSWORD}"    # These variables are required to set as environment in running wordpress docker
TF_STATE=terraform.tfstate ansible-playbook --inventory-file=${terraform_inventory} ../ansible/deploy_docker.yml --extra-vars "${ansible_params}" -v

# Print the public access URL
echo "Public access URL to access wordpress is ${PUBLIC_ACCESS_POINT}"
