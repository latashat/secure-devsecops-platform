# Use a minimal base image for security
FROM python:3.11-slim
# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
# Ensure logs are output immediately
ENV PYTHONUNBUFFERED=1
# Create non-root user for security
RUN addgroup --system appgroup && adduser --system appuser --ingroup appgroup
# Set working directory
WORKDIR /app
# Install system dependencies if needed
RUN apt-get update \
&& apt-get install -y --no-install-recommends gcc \
&& rm -rf /var/lib/apt/lists/*
# Copy dependency file first (better Docker layer caching)
COPY requirements.txt .
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Copy application source code
COPY . .
# Change ownership to non-root user
RUN chown -R appuser:appgroup /app
# Switch to non-root user
USER appuser
# Expose application port
EXPOSE 5000
# Healthcheck for container orchestration
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
 CMD curl -f http://localhost:5000/health || exit 1
# Run the application
CMD ["python", "app.py"]