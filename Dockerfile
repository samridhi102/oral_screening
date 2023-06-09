FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y python3-opencv
RUN pip install opencv-python

# Copy the application code
COPY . .

# Expose port 5000 for Flask application
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the command to start Flask application
CMD ["flask", "run"]


#
## configure the container to run in an executed manner
#EXPOSE 8080
#ENTRYPOINT ["python3.7", "app.py"]
#ENTRYPOINT ["gunicorn","--bind=0.0.0.0:8080","app:app"]