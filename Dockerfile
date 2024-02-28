FROM node as builder

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]