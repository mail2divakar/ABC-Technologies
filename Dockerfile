FROM tomcat
COPY ABCtechnologies-1.0.war /usr/local/tomcat/webapps/
COPY /target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/ABCtechnologies-1.0.war
CMD ["java","-war","/usr/local/tomcat/webapps/ABCtechnologies-1.0.war"]
