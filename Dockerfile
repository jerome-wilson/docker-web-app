# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Expose port and run
EXPOSE 5000
CMD ["python", "app.py"]
