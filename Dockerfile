# Use Java 17 JDK (Alpine small image)
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy mvnw and wrapper files first to use layer caching
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Make mvnw executable
RUN chmod +x mvnw

# Download dependencies offline to speed up build
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose the port
EXPOSE 8081

# Run the application using wildcard for jar
CMD ["sh", "-c", "java -jar target/*.jar"]
