FROM python:3.9-slim

# add apache bench (ab) tool
# ApacheBench (ab), a tool that can send thousands of HTTP requests quickly
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# create POST data files with ab friendly formats
RUN python make-data.py

CMD ["/app/generate-votes"]
