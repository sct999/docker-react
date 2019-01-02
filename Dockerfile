# step 1, build the app
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# step 2, copy build folder to nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


