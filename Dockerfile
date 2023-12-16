FROM node:18.18.0 as stage
WORKDIR /src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN ng build --prod

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

