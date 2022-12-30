FROM python:slim

ENV MAVEN_OPTS="-Xms2g -Xmx2g"
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-arm64
ENV M2_HOME=/usr/local/apache-maven
ENV MAVEN_HOME=/usr/local/apache-maven
ENV PATH=${M2_HOME}/bin:${PATH}
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
mvn clean -DskipTests \
-Dmaven.wagon.http.ssl.insecure=true \
-Dmaven.wagon.http.ssl.allowall=true \
-Dmaven.wagon.http.ssl.ignore.validity.dates=true  \
package -Pdist

# ENV MANAGE_LOCAL_HBASE=true
# ENV MANAGE_LOCAL_SOLR=true
# CMD [ "python3 atlas_start.py" ]