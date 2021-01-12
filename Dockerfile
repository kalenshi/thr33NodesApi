FROM node:alpine3.10

RUN apk update && apk add vim 

WORKDIR /home/node/app

COPY . .

RUN npm install 

EXPOSE 3000




