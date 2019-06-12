FROM ubuntu
MAINTAINER "raja"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME=/usr/local/
ADD apache-tomcat-9.0.16.tar.gz /root
COPY gamutkart/target/gamutkart.war /root/apache-tomcat-9.0.16/webapps
ENTRYPOINT /root/apache-tomcat-9.0.16/bin/startup.sh && bash

