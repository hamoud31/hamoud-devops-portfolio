# Stage 1: Build the WAR with Maven
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Package the application (creates WAR in /app/target)
RUN mvn clean package -DskipTests

# Stage 2: Run the WAR in Tomcat
FROM tomcat:10-jdk21
LABEL "Project"="Vprofile"
LABEL "Author"="Hamoud"

# Clean default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR from the build stage into Tomcat webapps as ROOT.war
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Set working directory
WORKDIR /usr/local/tomcat/

# Start Tomcat
CMD ["catalina.sh", "run"]
