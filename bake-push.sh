#!/bin/bash
AWS_ACCOUNT_ID=037399687915
REPO_NAME=logstash
LS_VERSION=6
REGION=us-east-1
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker build --build-arg LS_VERSION=$LS_VERSION -t $REPO_NAME:$LS_VERSION .
docker tag $REPO_NAME:$LS_VERSION $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$LS_VERSION
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$LS_VERSION