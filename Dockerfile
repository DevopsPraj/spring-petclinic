FROM ubuntu:pet
MAINTAINER prajeesh.c@gmail.com
RUN apt-get -y updates
RUN apt-get -y install default-jdk tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
RUN ln -s /usr/share/tomcat7/bin/catalina.sh /usr/local/bin/catalina.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ADD /var/lib/jenkins/workspace/PetClinic_Build/target/petclinic.war /var/lib/tomcat7/webapps
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
