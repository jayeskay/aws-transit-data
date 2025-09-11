# Docker Setup

## Installation

Because the local setup was performed on macOS, this requires Docker Desktop.

The Docker Engine can't ruln directly as on Linux due to the fact that a separate and dedicated VM is required to initialize a Linux kernel.

Docker daemon (dockerd) runs containers, which are just Linux processes with cgroups + namespaces. This is fine on a Linux system, but even something Unix-based isn't sufficient.

Thus, Docker Desktop is required.

```bash
brew install --cask docker
```

## Configuration

Were this being done on Linux, the CLI could be used for configurations--not the case on macOS, as mentioned.

Below are the settings used for building images and running containers:

![docker_setup1](docker_setup1.png)

Additionally, storage allowance is set to **128 GB**.

## Basic Run

Simple Dockerfile used for build process:

```Dockerfile
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
```
