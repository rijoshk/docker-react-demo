FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
CMD npm run build

FROM nginx
EXPOSE 8080
COPY --from=builder /app/build /usr/share/nginx/html