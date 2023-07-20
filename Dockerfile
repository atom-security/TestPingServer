FROM python:3.9

WORKDIR /app

RUN apt-get update && \
  apt-get install -y inetutils-ping

# Copy Requirements
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY . .

EXPOSE 80

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
