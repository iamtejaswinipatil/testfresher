# Use an official Tomcat base image
FROM tomcat:9.0-jdk11

# Set environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Set the port for the Tomcat server
EXPOSE 8082

# Copy your WAR file into the Tomcat webapps directory
COPY path-to-your-application.war /usr/local/tomcat/webapps/testfresher.war

# Change the Tomcat port to 8082 in the server.xml configuration
RUN sed -i 's/port="8080"/port="8082"/g' /usr/local/tomcat/conf/server.xml

# Start Tomcat
CMD ["catalina.sh", "run"]
