# Build stage
FROM node:22-alpine as build

WORKDIR /app

COPY ./apps/front/package.json ./
COPY ./apps/front/package-lock.json ./
COPY ./apps/front/ .

RUN npm run build

# Production stage
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

COPY ./apps/nginx/front-nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]