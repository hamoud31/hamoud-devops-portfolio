# Use official Maven image to build the app
FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy source code
COPY . .

# Build the project (skip tests if you want faster builds)
RUN mvn clean package -DskipTests

# Use a lightweight JDK image for runtime
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose application port (adjust if your app uses another port)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]

