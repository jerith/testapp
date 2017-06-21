FROM python:3-slim
LABEL maintainer "Bearnard Hibbins <bearnard@gmail.com>"

ENV TESTAPP_VERSION 0.0.11

COPY server.py /
COPY requirements.txt /
RUN pip install -r requirements.txt
CMD [ "python", "-u", "server.py" ]
