#!/bin/sh

cd /usr/bin/sample

gunicorn -w 2 -k uvicorn.workers.UvicornWorker main:app --bind 0.0.0.0:8080
