FROM python:3.10-slim

RUN mkdir -p /app
COPY ./requirements.txt /app
COPY ./app /app
COPY ./run-sample.sh /app

WORKDIR /app
RUN pip install --no-cache-dir --upgrade -r requirements.txt

CMD ["gunicorn", "-w", "2", "-k", "uvicorn.workers.UvicornWorker", "main:app", "--bind", "0.0.0.0:8080"]
