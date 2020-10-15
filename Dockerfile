#original image on which this image is based
FROM ubuntu

#run following console commands
RUN apt-get update \
&& apt-get -y install nano \
&& apt-get -y install python3 \
&& mkdir /opt/repo/

#set environment variables
ENV JAVA_HOME /opt/

#copy files over from the original environment
COPY . /  /opt/repo/
