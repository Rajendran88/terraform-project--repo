#!/bin/bash
# Replace the values below as needed
echo "Please provide the region : "
read REGION
REGION=$REGION
AMI_ID=ami-0d442a425e2e0a743
INSTANCE_TYPE=t2.micro
KEY_NAME=vockey
SECURITY_GROUP=default
# Launch the EC2 instance
aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-groups $SECURITY_GROUP \
  --region $REGION
# Print the instance ID
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=key-name,Values=$KEY_NAME" --query 'Reservations[].Instance>
echo "Instance ID: $INSTANCE_ID"