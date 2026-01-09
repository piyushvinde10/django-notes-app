FROM python:3.9-slim

WORKDIR /app/backend

COPY requirements.txt /app/backend

RUN microdnf update -y \
 && microdnf install -y \
      gcc \
      mysql-devel \
      pkgconf-pkg-config \
 && microdnf clean all

RUN pip install --upgrade pip \
 && pip install -r requirements.txt

COPY . /app/backend

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
