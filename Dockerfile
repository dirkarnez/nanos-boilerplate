FROM curlimages/curl:latest

COPY ./index.js .

RUN curl https://ops.city/get.sh -sSfL | sh

CMD ops pkg load node_v14.2.0 -p 8083 -f -n -a hi.js

EXPOSE 8083
