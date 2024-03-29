# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt first to leverage Docker cache
COPY requirements.txt .

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY src/ .

# Define environment variable
ENV NAME World

# Expose the port number that your Streamlit app runs on
EXPOSE 8501

# Run the Streamlit app when the container launches
CMD ["streamlit", "run", "app.py", "--server.port", "8501"]
