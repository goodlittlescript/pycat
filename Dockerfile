FROM python:3.7-alpine3.7 as base

# Set working directory
RUN mkdir -p /app
WORKDIR /app
ENV PATH="/app/bin:$PATH"

# Install pipenv
RUN pip install pipenv

# Install project dependencies
COPY Pipfile Pipfile.lock /project/
RUN pipenv install --dev

#############################################################################
FROM base as shell

# Install development dependencies
# * curl bash gawk diffutils expect for ts
RUN apk add --no-cache curl bash gawk diffutils expect && \
    cd /usr/local/lib && \
    curl -OL https://github.com/thinkerbot/ts/archive/v2.0.2.tar.gz && \
    tar -xvzf v2.0.2.tar.gz && \
    ln -s /usr/local/lib/ts-2.0.2/bin/ts /usr/local/bin/ts && \
    rm v2.0.2.tar.gz

#############################################################################
FROM base as app
COPY ./bin /app/bin
COPY ./lib /app/lib
