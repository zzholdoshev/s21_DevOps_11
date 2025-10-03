# Dockerfile for Session Service
FROM openjdk:11

# Set working directory
WORKDIR /payment_service

COPY . .
# Install dependencies
RUN apt update && apt install maven -y
RUN mvn -B dependency:go-offline
RUN mvn -N io.takari:maven:wrapper
RUN mvn -B package -DskipTests

# Define environment variables
ENV POSTGRES_HOST: postgres
ENV POSTGRES_PORT: 5432
ENV POSTGRES_USER : postgres
ENV POSTGRES_PASSWORD: "postgres"
ENV POSTGRES_DB: payments_db

# Run the application

ENTRYPOINT ["/bin/bash", "-c", "java -jar ./target/*.jar"]
