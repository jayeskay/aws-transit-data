# syntax=docker/dockerfile:1.7

# ----- base -----
# https://docs.astral.sh/uv/guides/integration/docker/
FROM python:3.12-slim AS base

# add uv
COPY --from=ghcr.io/astral-sh/uv:0.8.17 /uv /uvx /usr/local/bin/

# ----- builder (dependencies) -----
FROM base AS builder

# change working directory
WORKDIR /app

# System build deps only for the build stage
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc g++ pkg-config python3-dev \
    && rm -rf /var/lib/apt/lists/*

# copy requirements files
COPY pyproject.toml uv.lock ./

# install dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=pyproject.toml,target=/app/pyproject.toml \
    --mount=type=bind,source=uv.lock,target=/app/uv.lock \
    uv sync --locked --no-install-project

# ----- runtime -----
FROM base AS runtime

# change working directory
WORKDIR /app

# set environment variables
ENV PATH="/app/.venv/bin:$PATH" \
    UV_LINK_MODE=copy \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Bring only the venv from builder; no compilers in runtime
COPY --from=builder /app/.venv /app/.venv

# copy data file
COPY data/ ./data

# unzip
RUN gzip -d ./data/green_tripdata_2019-09.csv.gz

# copy .py files
COPY src/ ./src

# execute
CMD ["uv", "run", "./src/docker_process.py"]
