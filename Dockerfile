FROM python:3.9-slim

WORKDIR /app/backend

COPY requirements.txt /app/backend
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      gcc \
      default-libmysqlclient-dev \
      pkg-config \
 && rm -rf /var/lib/apt/lists/*


# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/backend

EXPOSE 8000
#RUN python manage.py migrate
#RUN python manage.py makemigrations
