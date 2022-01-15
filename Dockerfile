FROM ubuntu:latest

COPY ./index.js .

RUN apt-get update -y \ 
  && apt-get -y --no-install-recommends install \
     ca-certificates \
     build-essential \
     qemu-kvm \
     qemu-utils \
     curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && curl https://ops.city/get.sh -sSfL | sh

CMD echo "$HOME/.ops/bin/ops pkg load node_v14.2.0 -p 8083 -f -n -a index.js" > commands.txt && cat commands.txt | bash


EXPOSE 8083
