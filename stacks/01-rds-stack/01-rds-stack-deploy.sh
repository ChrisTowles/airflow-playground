#!/bin/bash
set -e;  # stop on errors

TEMPLATE_FILE=stacks/01-rds-stack/01-rds-stack.yaml
STACK_NAME="airflow-playground-01-rds"
AWS_PROFILE=default

sam validate --profile $AWS_PROFILE --template $TEMPLATE_FILE  --region us-east-1 --lint


aws --profile $AWS_PROFILE cloudformation deploy --template-file $TEMPLATE_FILE --stack-name $STACK_NAME --parameter-overrides ConfigName=dev --tags product=airflow