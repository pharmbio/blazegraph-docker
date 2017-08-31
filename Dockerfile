FROM ubuntu:16.04
MAINTAINER samuel.lampa@farmbio.uu.se

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget less vim sudo default-jre-headless

RUN wget -O blazegraph_2.1.4.deb https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_2_1_4/blazegraph.deb
RUN dpkg -i blazegraph_2.1.4.deb

RUN echo 'blzg ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
EXPOSE 9999

USER blzg
CMD sudo service blazegraph start & /bin/bash
