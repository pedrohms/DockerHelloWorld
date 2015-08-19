FROM ubuntu:14.04
MAINTAINER Pedro Henrique <pedrosouza412@gmail.com>
ENV MAVEN_VERSION 3.3.3
ENV PROJECT_FOLDER /opt/HelloWorld
RUN apt-get update
RUN apt-get install -y git wget nano unzip
WORKDIR /opt
RUN wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-$MAVEN_VERSION-bin.zip
RUN unzip apache-maven-$MAVEN_VERSION-bin.zip
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz
RUN tar xzvf jdk-8u51-linux-x64.tar.gz
ENV PATH /opt/apache-maven-$MAVEN_VERSION/bin:/opt/jdk1.8.0_51/bin:$PATH
ENV JAVA_HOME /opt/jdk1.8.0_51
RUN git clone https://github.com/pedrohms/HelloWorld.git
RUN rm apache-maven-$MAVEN_VERSION-bin.zip
RUN rm jdk-8u51-linux-x64.tar.gz
WORKDIR $PROJECT_FOLDER
RUN mvn clean compile jar:jar
ENTRYPOINT java -jar $PROJECT_FOLDER/HelloWorld-1.0-SNAPSHOT.jar
