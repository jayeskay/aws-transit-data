# ----- build -----
# https://hub.docker.com/_/alpine
FROM alpine:3.22 AS base

# install python
RUN apk add --no-cache python3 py3-pip

# change working directory for storing files
WORKDIR /app

# copy .py file
COPY /src/docker_test.py ./

# ----- runtime -----
FROM base AS runtime

# set environment variables
ENV SOMENAME=yourname

WORKDIR /app

CMD ["python3", "docker_test.py"]
