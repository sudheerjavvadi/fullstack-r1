# Stage 1: Build with Maven
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /build

# Copy pom.xml first for dependency caching
COPY backend/pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY backend/src ./src

# Build the JAR
RUN mvn clean package -DskipTests -Dproject.build.sourceEncoding=UTF-8

# Stage 2: Runtime with JRE only
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy built JAR from builder stage
COPY --from=builder /build/target/citizen-connect-backend-1.0.0.jar app.jar

EXPOSE 8080

# Railway sets $PORT env var; Spring Boot reads it via ${PORT:8080} in application.yml
ENTRYPOINT ["java", "-jar", "app.jar"]
