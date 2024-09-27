#!/bin/bash

cd /home/ec2-user

rm -rf *

# 컨테이너 이름 설정
CONTAINER_NAME="fast-api"

# 컨테이너가 실행 중인지 확인
if docker ps -q -f name=$CONTAINER_NAME | grep -q .; then
    echo "$CONTAINER_NAME 컨테이너가 실행 중입니다. 중지합니다..."
    docker stop $CONTAINER_NAME
    echo "$CONTAINER_NAME 컨테이너가 중지되었습니다."
elif docker ps -aq -f status=exited -f name=$CONTAINER_NAME | grep -q .; then
    echo "$CONTAINER_NAME 컨테이너가 이미 중지되어 있습니다."
else
    echo "$CONTAINER_NAME 컨테이너가 존재하지 않습니다."
fi
