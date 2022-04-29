FROM ubuntu:20.04

RUN apt update && \
  apt install software-properties-common -y && \
  apt install curl -y

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

RUN apt-add-repository "deb [arch=arm64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt update && \
  apt install vault -y

CMD vault server -dev