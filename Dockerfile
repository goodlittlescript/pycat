FROM python:3.7-alpine3.7 as base

# Set working directory
RUN mkdir -p /app
WORKDIR /app
ENV PATH="/app/bin:$PATH"

# Install pipenv
RUN pip install pipenv

# Install project dependencies
COPY Pipfile Pipfile.lock /app/
RUN pipenv install --system

#############################################################################
FROM base as shell

# Install development dependencies
# * curl bash gawk diffutils expect for ts
RUN apk add --no-cache curl bash gawk diffutils expect && \
    curl -o /usr/local/bin/ts -L https://raw.githubusercontent.com/thinkerbot/ts/v2.0.2/bin/ts && \
    chmod +x /usr/local/bin/ts && \
    pipenv install --dev --system

#############################################################################
FROM base as app
COPY ./bin /app/bin
COPY ./lib /app/lib
