# https://hub.docker.com/_/alpine
FROM alpine:3.22

# set environment variables
ENV SOMENAME=yourname

# change working directory for storing files
WORKDIR /app

# copy .py file
COPY /src/docker_test.py ./

# install python
RUN apk add --no-cache python3 py3-pip
