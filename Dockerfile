FROM ubuntu:16.04
MAINTAINER samuel.lampa@farmbio.uu.se

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget less vim sudo default-jre-headless
RUN adduser blaze
RUN mkdir -p /etc/sudoers.d
RUN echo "blaze ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/blaze && chmod 0440 /etc/sudoers.d/blaze
RUN mkdir /blaze && chown -R blaze:blaze /blaze

RUN wget -O blazegraph_2.1.4.deb https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_2_1_4/blazegraph.deb
RUN dpkg -i blazegraph_2.1.4.deb

ENV HOME /blaze
USER blaze

EXPOSE 9999
CMD sudo service blazegraph start & /bin/bash
