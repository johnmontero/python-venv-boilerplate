FROM amazonlinux:latest

RUN yum -y update && yum -y install \
    python36 \
    python36-pip \
    python36-devel \
    zsh

ONBUILD ADD app /app/
WORKDIR /app

RUN pip-3.6 install pipenv