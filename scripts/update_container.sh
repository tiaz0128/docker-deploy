#!/bin/sh

RUN chmod +x /home/ec2-user/scripts/update_container.sh

# 변수 설정
IMAGE_NAME="tiaz0128/fast-api"
CONTAINER_NAME="fast-api"

# 최신 이미지 pull
docker pull $IMAGE_NAME:latest

# 기존 컨테이너 중지 및 제거
docker stop $CONTAINER_NAME

# 새 컨테이너 시작
docker run -d --rm --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME:latest

echo "Container updated and restarted"