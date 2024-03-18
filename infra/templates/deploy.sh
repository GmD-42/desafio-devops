#! /bin/bash

    aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin ${AWS_ACCOUNT_NUMBER}.dkr.ecr.us-east-1.amazonaws.com 

    sudo docker pull ${AWS_ACCOUNT_NUMBER}.dkr.ecr.us-east-1.amazonaws.com/api:latest

    sudo docker compose -f /local/api/docker-compose.yaml up -d