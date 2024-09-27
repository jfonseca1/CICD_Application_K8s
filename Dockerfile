FROM python:3.8-slim-buster

WORKDIR /app

# Install pip
RUN apt-get update && apt-get install -y python3-pip

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install --no-cache-dir Flask==2.2.2 Werkzeug==2.2.2

COPY . .

CMD ["python3", "-m", "app.py", "run", "--host=0.0.0.0"]
