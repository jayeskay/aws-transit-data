# ----- base -----
# https://docs.astral.sh/uv/guides/integration/docker/
FROM python:3.12-slim AS base

# add uv
COPY --from=ghcr.io/astral-sh/uv:0.8.17 /uv /uvx /usr/local/bin/

# ----- deps -----
FROM base AS deps

# change working directory
WORKDIR /app

# copy requirements files
COPY pyproject.toml uv.lock ./

# install dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project

# ----- runtime -----
FROM base AS runtime

# set environment variables
ENV PATH="/app/.venv/bin:$PATH" \
    UV_LINK_MODE=copy \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    SOMENAME=yourname

# change working directory
WORKDIR /app

# copy .py + reqs files
COPY src/docker_test.py ./

# execute
CMD ["uv", "run", "./docker_test.py"]
