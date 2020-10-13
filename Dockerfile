#original image on which this image is based
FROM ubuntu

#run following console commands
RUN apt-get update \
&& apt-get -y install nano \
&& mkdir /opt/repo/

#set environment variables
ENV JAVA_HOME /opt/

#copy files over from the original environment
COPY script_1.py /opt/repo/script_1.py
COPY script_2.py /opt/repo/script_2.py
