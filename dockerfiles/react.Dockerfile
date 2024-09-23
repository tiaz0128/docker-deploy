FROM node

WORKDIR /app

RUN npm install -g create-react-app

CMD ["create-react-app", "my-app"]
