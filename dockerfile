FROM python:slim

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV M2_HOME=/usr/local/apache-maven
ENV MAVEN_HOME=/usr/local/apache-maven
ENV PATH=${M2_HOME}/bin:${PATH}
ENV MAVEN_OPTS="-Xms2g -Xmx2g"


RUN apt update &&\
apt install -y wget &&\
wget https://www.apache.org/dyn/closer.cgi/atlas/2.3.0/apache-atlas-2.3.0-sources.tar.gz &&\
apt install -y default-jre &&\
apt-get install -y openjdk-11-jdk &&\
apt install -y maven &&\
mvn clean -DskipTests -Drat.skip=true -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true package -Pdist,embedded-hbase-solr  


CMD [ "python3 atlas_start.py" ]