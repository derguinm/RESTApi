# official Python image
FROM python:latest

WORKDIR /app

COPY reqs.txt .

RUN apt update && apt upgrade -y

RUN pip install --no-cache-dir -r reqs.txt

# Copy the rest of the application code to the working directory
COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
