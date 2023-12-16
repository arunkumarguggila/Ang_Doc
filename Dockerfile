FROM node as stage
WORKDIR /src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm build


