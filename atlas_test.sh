#

Docker run -it -p 21000:21000 ubuntu /bin/bash


export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 &&\
export M2_HOME=/usr/local/apache-maven &&\
export MAVEN_HOME=/usr/local/apache-maven &&\
export PATH=${M2_HOME}/bin:${PATH} &&\
export MAVEN_OPTS="-Xms2g -Xmx2g"  &&\


apt update &&\
apt install sudo &&\
sudo apt install -y git &&\
sudo apt install -y wget &&\
sudo apt install -y python3-pip &&\
sudo apt install -y software-properties-common &&\
sudo add-apt-repository -y ppa:deadsnakes/ppa &&\
sudo apt -y install python3.9 &&\
sudo apt -y install default-jre &&\
sudo apt-get -y install openjdk-8-jdk &&\
sudo apt -y install maven &&\
sudo git clone https://git-wip-us.apache.org/repos/asf/atlas.git && \
cd atlas  &&\

mvn clean -DskipTests -Drat.skip=true -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true package -Pdist,embedded-hbase-solr  

python3 &(find -iname atlas_start.py)  

  


===  

  

  



cd /usr/local && \  

wget https://www-eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
tar xzf apache-maven-3.6.3-bin.tar.gz && \  
ln -s apache-maven-3.6.3 apache-maven && \  

  

 