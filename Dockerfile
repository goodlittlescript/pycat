FROM python:3.7-buster

# Setup appuser and app dir
RUN groupadd -g 1001 appuser && \
    useradd -r -u 1001 -g appuser appuser -m -s /bin/bash && \
    mkdir -p /app && \
    chown appuser:appuser /app
WORKDIR /app

# Install pipenv
RUN pip install pipenv

# Install project dependencies
COPY Pipfile Pipfile.lock /app/
RUN pipenv install --system

# Install development dependencies
# * curl bash gawk diffutils expect for ts
RUN apt-get update && \
    apt-get install -y curl bash gawk diffutils expect && \
    curl -o /usr/local/bin/ts -L https://raw.githubusercontent.com/thinkerbot/ts/v2.0.3/bin/ts && \
    chmod +x /usr/local/bin/ts

RUN pipenv install --dev --system
USER appuser
