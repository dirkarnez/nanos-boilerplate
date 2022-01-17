FROM ubuntu:latest

COPY ./index.js .
COPY ./config.json .

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

# CMD echo "$HOME/.ops/bin/ops pkg load node_v14.2.0 -p 8083 -f -n -a index.js" > commands.txt && cat commands.txt | bash
# CMD echo "$HOME/.ops/bin/ops build mynewimgelf -c config.json -i mynewimg  && cd $HOME/.ops/images/ && ls" > commands.txt && cat commands.txt | bash
CMD echo "$HOME/.ops/bin/ops image create --nightly --package node_v14.2.0 -c config.json -i new_img && $HOME/.ops/bin/ops instance create new_img.img -c config.json --instance-name testing_new_img -t onprem -z onprem" > commands.txt && cat commands.txt | bash && bash

EXPOSE 8083
