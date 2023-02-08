FROM alpine
RUN apk add openjdk11
#RUN apk add ufw
RUN adduser -h /opt/tomcat -s /bin/false -D tomcat tomcat
COPY apache-tomcat-9.0.31.tar.gz /
RUN tar -xf apache-tomcat-9.0.31.tar.gz -C /opt/tomcat
RUN chown -R tomcat: /opt/tomcat/*
RUN sh -c 'chmod +x /opt/tomcat/apache-tomcat-9.0.31/bin/*.sh'
COPY tomcat-users.xml /opt/tomcat/apache-tomcat-9.0.31/conf/tomcat-users.xml
#RUN ufw allow 8080/tcp
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "/opt/tomcat/apache-tomcat-9.0.31/bin/startup.sh"]
