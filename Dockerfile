FROM ubuntu:23.04
ENV JAVA_HOME=/u01/middleware/jdk-11.0.2
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-9.0.76
ENV PATH=$PATH:$JAVA_HOME/bin:$TOMCAT_HOME/bin


RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware
ADD https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz .
RUN tar -xzvf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN rm openjdk-11.0.2_linux-x64_bin.tar.gz

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz .
RUN tar -xzvf apache-tomcat-9.0.76.tar.gz
RUN rm apache-tomcat-9.0.76.tar.gz

RUN mkdir -p /u01/apps

WORKDIR /u01/apps

COPY target/ibankingsafe-1.0.jar  .
RUN chmod u+x /u01/apps/ibankingsafe-1.0.jar

ENTRYPOINT [ "java", "-jar", "ibankingsafe-1.0.jar" ]

