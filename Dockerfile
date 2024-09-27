# syntax=docker/dockerfile:1
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for building Python packages
RUN apk add --no-cache gcc musl-dev libc-dev

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the Flask default port
EXPOSE 5000

# Set environment variable for Flask to run in production mode
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the application
CMD ["python3", "-m", "flask", "run"]

