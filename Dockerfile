FROM python:3.9-slim

WORKDIR /app/backend

COPY requirements.txt /app/backend

ENV DEBIAN_FRONTEND=noninteractive

RUN apk update \
 && apk add --no-cache \
      gcc \
      musl-dev \
      mariadb-connector-c-dev \
      pkgconfig

RUN pip install --upgrade pip \
 && pip install -r requirements.txt

COPY . /app/backend

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
