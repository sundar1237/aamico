FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
#RUN python -m pip install --proxy=aproxy.corproot.net:8080 -r requirements.txt --no-cache-dir
RUN python -m pip install -r requirements.txt --no-cache-dir
COPY . /code/