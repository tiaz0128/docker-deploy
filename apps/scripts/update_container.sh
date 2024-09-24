#!/bin/sh

# 변수 설정
IMAGE_NAME="your_dockerhub_username/your_image_name"
CONTAINER_NAME="your_container_name"

# 최신 이미지 pull
docker pull $IMAGE_NAME:latest

# 기존 컨테이너 중지 및 제거
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# 새 컨테이너 시작
docker run -d --name $CONTAINER_NAME $IMAGE_NAME:latest

echo "Container updated and restarted"