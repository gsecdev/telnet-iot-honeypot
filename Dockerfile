FROM python:2

WORKDIR /usr/src/app

COPY ./requirements.txt ./
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient
COPY patches/client.py /usr/local/lib/python2.7/site-packages/engineio/client.py
COPY patches/flask_httpauth.py /usr/local/lib/python2.7/site-packages/flask_httpauth.py

COPY . .

RUN apt update && apt install -y sqlite3
