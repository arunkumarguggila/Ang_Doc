FROM node:latest as stage

WORKDIR /src/app

COPY package*.json ./

RUN npm config set strict-ssl false

RUN npm install --legacy-peer-deps

COPY . .

# Stage 1: Build the Angular app with configuration
RUN npm run build

# Stage 2: Use Nginx to serve the built Angular app
FROM nginx

# Copy the built app from the previous stage to Nginx's HTML directory
COPY --from=stage /src/app/dist/ang-docker-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
