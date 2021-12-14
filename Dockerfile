FROM python:3.10-alpine

RUN mkdir /project
RUN mkdir -p /data/logs/

COPY requirements.txt /project/

RUN apk add --update bash ca-certificates gcc linux-headers make musl-dev libffi-dev zlib-dev git bash python3-dev php8-pecl-imagick
RUN apk add postgresql-dev
RUN python -m pip install --upgrade pip
RUN pip install -r /project/requirements.txt

COPY . /project/
WORKDIR /project/

RUN chmod +x /project/config/start_django.sh

EXPOSE 8000
CMD ["bash", "/project/config/start_django.sh"]