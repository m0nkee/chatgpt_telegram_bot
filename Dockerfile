FROM ubuntu:latest

ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONHASHSEED=random
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

RUN apt-get -y update
RUN apt-get install -y python3 python3-pip build-essential python3-venv
RUN apt-get install -y net-tools iproute2

RUN mkdir -p /code
ADD . /code
WORKDIR /code

RUN pip3 install -r requirements.txt

RUN apt-get install -y ffmpeg

CMD ["/bin/bash"]