FROM nginx:1.21.1-alpine

WORKDIR /usr/share/nginx/html/
COPY src/index.html .

EXPOSE 80