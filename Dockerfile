# syntax=docker/dockerfile:1
FROM python:3.10.11-alpine

# Set working directory
WORKDIR /app

# Install system dependencies required for building Python packages
RUN apk add --no-cache gcc musl-dev libc-dev

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose Flask's default port
EXPOSE 5000

# Run the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
