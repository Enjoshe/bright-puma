# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose port 5000 for the Flask app
EXPOSE 5000

# Define environment variable (optional, for production settings)
ENV FLASK_APP=app.py

# Run the application
CMD ["python", "app.py"]
