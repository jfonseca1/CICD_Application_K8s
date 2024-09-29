# Step 1: Use a base image with Python
FROM python:3.8-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the current directory contents into the container at /app
COPY . /app

# Step 4: Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose the port Flask runs on (5000)
EXPOSE 5000

# Step 6: Define environment variable for Flask
ENV FLASK_APP=app.py

# Step 7: Run the Flask app when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
