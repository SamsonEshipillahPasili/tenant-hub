# ==============================================================================
# 1. BUILD STAGE
# ==============================================================================
FROM python:3.13-slim AS builder

# Set working directory
WORKDIR /app

# Enable bytecode compilation and specify UV options
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

# Install uv package manager from the official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy only dependency description files to leverage Docker layer caching
COPY pyproject.toml uv.lock ./

# Install project dependencies into a virtual environment at /app/.venv
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-install-project --no-dev


# ==============================================================================
# 2. RUNTIME STAGE
# ==============================================================================
FROM python:3.13-slim AS runner

# Create a non-privileged user and group to run the app securely
RUN groupadd -g 10001 appuser && \
    useradd -u 10001 -g appuser -m -s /sbin/nologin appuser

# Set working directory
WORKDIR /app

# Set critical Python environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

# Copy application files
COPY . /app

# Copy the pre-built virtual environment from the builder stage after COPY . /app
# to ensure it overwrites any local virtual environment copied from the host.
COPY --from=builder /app/.venv /app/.venv

# Create staticfiles and media directories and change ownership of application files
RUN mkdir -p /app/staticfiles /app/media && \
    chown -R appuser:appuser /app

# Switch to the secure non-privileged user
USER appuser

# Collect static files during image build
RUN python manage.py collectstatic --noinput

# Expose Daphne's service port
EXPOSE 8000

# Run migrations and start Daphne
CMD ["sh", "-c", "python manage.py migrate && daphne -b 0.0.0.0 -p 8000 tenant_hub.asgi:application"]
