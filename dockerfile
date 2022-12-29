FROM python:slim

RUN apt update &&\
apt -y install default-jre &&\
apt-get -y install openjdk-8-jdk &&\
apt -y install maven &&\
mvn clean -DskipTests -Drat.skip=true -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true package -Pdist,embedded-hbase-solr  


CMD [ "python3 atlas_start.py" ]