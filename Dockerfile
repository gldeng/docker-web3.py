FROM python:3.6

# Set up code directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install Linux dependencies
RUN apt-get update && apt-get install -y libssl-dev \
  && apt install -y netcat-openbsd \
  && git clone https://github.com/ethereum/web3.py.git ./ \
  && git checkout tags/v3.16.5 \
  && echo amqpy >> requirements-dev.txt \
  && pip install -r requirements-dev.txt \
  && pip install -e .

WORKDIR /app
