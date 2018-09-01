FROM amazonlinux

# Setup development
RUN yum install -y vim groff && \
    mkdir -p /project
WORKDIR /project
ENV PATH="/project/bin:$PATH"

# Install ts
RUN yum install -y diffutils && \
    cd /usr/local/lib && \
    curl -OL https://github.com/thinkerbot/ts/archive/v2.0.1.tar.gz && \
    tar -xvzf v2.0.1.tar.gz && \
    ln -s /usr/local/lib/ts-2.0.1/bin/ts /usr/local/bin/ts && \
    rm v2.0.1.tar.gz

# Install pipenv
RUN yum install -y python27-pip && \
    pip install pipenv

# Install project dependencies
COPY Pipfile Pipfile.lock /project/
RUN pipenv install --system --dev
