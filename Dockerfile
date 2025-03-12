# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the Maven wrapper (if using Maven) to download dependencies first
COPY pom.xml .
COPY src ./src

# Build the application
RUN ./mvnw clean install -DskipTests

# Expose the port the app runs on (for example, 8080)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/your-app.jar"]
