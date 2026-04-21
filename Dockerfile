FROM amazonlinux:latest
RUN yum update -y && \
    yum install -y wget tar findutils procps ncurses gzip git java-17-amazon-corretto maven && \
    yum clean all
WORKDIR /opt
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar -zxvf apache-tomcat-9.0.85.tar.gz && \
    rm -rf apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85 tomcat
RUN rm -rf /opt/tomcat/webapps/*
COPY target/bank-app.war /opt/tomcat/webapps/ROOT.war
WORKDIR /opt/tomcat
EXPOSE 8080
CMD ["bin/catalina.sh", "run"]
