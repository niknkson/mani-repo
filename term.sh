#!/bin/bash
LIST=$1
PROFILE=$2
cat $LIST|while read line
do
ID=`echo $line |awk '{print $1}'`
TAG=`echo $line |awk '{print $2}'`
aws ec2 terminate-instances --instance-ids $ID
done
