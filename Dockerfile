FROM node:alpine
RUN apk add g++ make python3 linux-headers
RUN apk add --update py3-pip
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"
# ENTRYPOINT ["tail", "-f", "/dev/null"]
COPY package.json .
RUN npm install

COPY server server
COPY public public
COPY app.js .

EXPOSE 3000
EXPOSE 40000-49999/tcp
EXPOSE 40000-49999/udp


CMD [ "node", "app.js" ]

# FROM ubuntu:18.04
# RUN apt-get update && \
#     apt-get install -y build-essential pip net-tools iputils-ping iproute2 curl

# RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
# RUN apt-get install -y nodejs
# RUN npm install -g watchify

# COPY package.json .
# RUN npm install && npm install -g browserify
# COPY server server
# COPY public public
# COPY app.js . 

# EXPOSE 3000
# EXPOSE 40000-40100/tcp
# EXPOSE 40000-40100/udp
# ENV PORT 3000

# CMD [ "node", "app.js" ]