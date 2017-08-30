FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget less vim
RUN apt-get -y install default-jre-headless
RUN wget -O blazegraph_2.1.4.deb https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_2_1_4/blazegraph.deb
RUN dpkg -i blazegraph_2.1.4.deb

ENV HOME /root
EXPOSE 9999

CMD service blazegraph start & /bin/bash
