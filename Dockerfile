FROM ubuntu:18.04

MAINTAINER "Kevin Foo <chbsd64@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

ARG BRANCH="emotet"


RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y python3-pip git cmake \
  && apt-get install -y unzip vim


RUN git clone -b "$BRANCH" --single-branch https://github.com/0ssigeno/qiling

WORKDIR /qiling

RUN pip3 install -r requirements.txt \
  && python3 setup.py install

RUN pysite1=$(python3 -c "import site; print(site.getsitepackages()[0])"); \
  pysite2=$(python3 -c "import site; print(site.getsitepackages()[1])") \
  && cp ${pysite1}${pysite2}/keystone/libkeystone.so $pysite1/keystone/

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /qiling


CMD bash
