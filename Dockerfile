FROM python:3.9-bullseye

WORKDIR /app/backend

COPY requirements.txt /app/backend

RUN apt-get update \
 && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
 && pip install -r requirements.txt

COPY . /app/backend

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
