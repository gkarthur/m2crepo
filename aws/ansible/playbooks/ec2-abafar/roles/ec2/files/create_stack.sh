#!/usr/bin/env bash

aws2 cloudformation create-stack --template-body file:///tmp/ec2.yml --stack-name abafar

