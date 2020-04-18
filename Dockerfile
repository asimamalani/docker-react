FROM node:alpine
WORKDIR /usr/src/app
COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /usr/src/app/build /usr/share/nginx/html
