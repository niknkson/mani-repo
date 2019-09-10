#!/bin/bash
LIST=$1
PROFILE=$2
cat $LIST|while read line
do
ID=`echo $line |awk '{print $1}'`
TAG=`echo $line |awk '{print $2}'`
aws ec2 create-image --instance-id $ID --name "$TAG" --description "$TAG" --no-reboot --profile $PROFILE > ami-id
AMI=`cat ami-id`
aws ec2 create-tags --resources $AMI --tags Key=Name,Value=$TAG --profile $PROFILE
done
