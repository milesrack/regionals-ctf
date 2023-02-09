#!/bin.sh
rc-service sshd start
su -s /bin/sh tomcat -c '/opt/tomcat/apache-tomcat-9.0.31/bin/catalina.sh run'
