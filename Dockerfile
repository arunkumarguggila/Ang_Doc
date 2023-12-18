FROM node:latest as stage
WORKDIR /src/app
COPY package*.json ./
RUN npm config set strict-ssl false
RUN npm install --legacy-peer-deps
COPY . .
CMD ["npm", "start"]

FROM nginx
COPY --from=stage /dist/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


