FROM node:latest
MAINTAINER ballacoipruppi@hotmail.com

#update apt repos
RUN apt-get update

#install nginx
RUN apt-get install -y nginx

#change nginx document root folder
RUN sed -i s@/var/www/html@/nighttab/build/web/@ /etc/nginx/sites-enabled/default

# clone master repo
RUN git clone https://github.com/zombieFox/nightTab /nighttab

#change workdir
WORKDIR /nighttab

#install dependencies
RUN npm install build

#run the build
RUN npm run build

#expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

