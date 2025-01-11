# Build stage
FROM node:22-alpine as react-build

WORKDIR /app

# 먼저 package 파일들만 복사
COPY ./apps/front/package.json ./
COPY ./apps/front/package-lock.json ./

# 의존성 설치
RUN npm install

# 소스 코드 복사
COPY ./apps/front/ .

# 빌드
RUN npm run build

# Production stage
FROM nginx:alpine

COPY --from=react-build /app/build /usr/share/nginx/html

COPY ./apps/nginx/front-nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]