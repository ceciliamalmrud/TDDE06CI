FROM nginx:latest
WORKDIR /NGINX
ADD . /NGINX
setytgut

RUN ["nginx", "-t", "-c", "nginx.conf"] 
CMD ["nginx","-c","nginx.conf", "-g", "daemon off;"]
