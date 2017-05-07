FROM node:7
MAINTAINER Handle Huang <handle.huang@outlook.com>
RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list 
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list 
RUN sed -i "s/security.debian.org/mirrors.aliyun.com\/debian-security/g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y git

RUN yarn install -g gulp forever

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

COPY ./start_docker_server.sh /opt/scripts

CMD ["/opt/scripts/start_docker_server.sh"]