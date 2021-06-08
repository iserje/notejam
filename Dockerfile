FROM public.ecr.aws/bitnami/python:latest
LABEL maintainer="Serge Ivanov serje@homtial.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /app
COPY requirements.txt /app

RUN apt-get update \
    && pip install --upgrade pip \
    && pip install -r /app/requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

ENTRYPOINT []
CMD ["python", "runserver.py"]