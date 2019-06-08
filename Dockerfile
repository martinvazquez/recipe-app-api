FROM python:3.7-alpine
MAINTAINER Martin Vazquez

# recommended for docker images
# python dont buffered the outputs, print directly
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create an user without home directory, is only for run the app
# is recommended dont use root user
RUN adduser -D user
USER user