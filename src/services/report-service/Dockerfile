# Dockerfile for Session Service
FROM openjdk:11

# Set working directory
WORKDIR /report_service

COPY . .
RUN apt update && apt install maven -y
RUN mvn -B dependency:go-offline
RUN mvn -N io.takari:maven:wrapper
RUN mvn -B package -DskipTests


# Define environment variables
ENV POSTGRES_HOST=postgres
ENV POSTGRES_PORT=5432
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD="postgres"
ENV POSTGRES_DB=statistics_db
ENV RABBIT_MQ_HOST=rabbitmq
ENV RABBIT_MQ_PORT=5672
ENV RABBIT_MQ_USER=guest
ENV RABBIT_MQ_PASSWORD=guest
ENV RABBIT_MQ_QUEUE_NAME=messagequeue
ENV RABBIT_MQ_EXCHANGE=messagequeue-exchange

# Run the application
ENTRYPOINT ["/bin/bash", "-c", "java -jar ./target/*.jar"]
