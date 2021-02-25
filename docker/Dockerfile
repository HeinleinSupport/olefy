FROM python:3-alpine

WORKDIR /app

COPY requirements.txt .

RUN apk add --no-cache --virtual .build-deps \
        cargo \
        gcc \
        libffi-dev \
        musl-dev \
        openssl-dev \
        python3-dev && \
    apk add --no-cache \
        libffi \
        libmagic \
        netcat-openbsd && \
    pip install -r requirements.txt && \
    apk del .build-deps

COPY olefy.py /usr/local/bin/olefy.py

RUN adduser -S olefy && chmod +x /usr/local/bin/olefy.py
USER olefy

ENV OLEFY_PYTHON_PATH /usr/local/bin/python3
ENV OLEFY_BINDADDRESS 0.0.0.0
ENV OLEFY_LOGLVL 30
ENV OLEFY_BINDPORT 10050

ENTRYPOINT ["/usr/local/bin/olefy.py"]