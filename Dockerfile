# Use official Java image
FROM openjdk:17-jdk-alpine

# Add a volume to store logs (optional)
VOLUME /tmp

# Copy the jar (make sure to build with `mvn clean package` first)
COPY target/task-manager-0.0.1-SNAPSHOT.jar app.jar

# Run the jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
