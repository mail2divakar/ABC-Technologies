FROM tomcat:8.0-alpine
LABEL maintainer="mail2divakar@gmail.com"

ADD target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
