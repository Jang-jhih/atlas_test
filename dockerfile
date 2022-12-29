FROM python:slim

ENV MAVEN_OPTS="-Xms2g -Xmx2g"


RUN apt update &&\
apt install -y wget &&\
wget https://downloads.apache.org/atlas/2.3.0/apache-atlas-2.3.0-sources.tar.gz &&\
tar zxvf apache-atlas-2.3.0-sources.tar.gz

RUN apt install -y default-jre &&\
apt-get install -y openjdk-11-jdk &&\
apt install -y maven 

RUN cd apache-atlas-sources-2.3.0 &&\
apt install -y npm &&\
mvn clean -DskipTests -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true install

# CMD [ "python3 atlas_start.py" ]