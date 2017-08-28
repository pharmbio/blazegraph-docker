FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget less vim
RUN apt-get -y install default-jre-headless
RUN wget -O blazegraph_2.1.1.deb https://sourceforge.net/projects/bigdata/files/bigdata/2.1.1/blazegraph.deb/download && dpkg -i blazegraph_2.1.1.deb

ENV HOME /root
EXPOSE 9999

CMD service blazegraph start && tail -F /var/log/blazegraph/blazegraph.log
