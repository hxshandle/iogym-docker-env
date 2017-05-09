FROM node:7
MAINTAINER Handle Huang <handle.huang@outlook.com>
RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list 
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list 
RUN sed -i "s/security.debian.org/mirrors.aliyun.com\/debian-security/g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y git

RUN yarn add -g gulp forever

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

COPY ./start_socket_server.sh /opt/scripts/start_socket_server.sh

RUN chmod +x /opt/scripts/start_socket_server.sh

CMD ["/opt/scripts/start_socket_server.sh"]