FROM alpine
COPY apache-tomcat-9.0.31.tar.gz /
COPY entrypoint.sh /
COPY user.txt /
COPY root.txt /root/
COPY note.txt /
RUN apk add openjdk11 openssh openrc
RUN rc-update add sshd
RUN rc-status && touch /run/openrc/softlevel
RUN echo 'root:t0mc@t789' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN adduser -h /opt/tomcat -s /bin/false -D tomcat tomcat
RUN tar -xf apache-tomcat-9.0.31.tar.gz -C /opt/tomcat && rm /apache-tomcat-9.0.31.tar.gz
RUN chown -R tomcat: /opt/tomcat/*
RUN sh -c 'chmod +x /opt/tomcat/apache-tomcat-9.0.31/bin/*.sh'
RUN chmod +x /entrypoint.sh
RUN chmod 400 /root/root.txt
RUN chown tomcat: /user.txt && chmod 400 /user.txt
RUN chmod 444 /note.txt
EXPOSE 22 8080
ENTRYPOINT ["sh", "/entrypoint.sh"]