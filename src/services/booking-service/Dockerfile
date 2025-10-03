# Dockerfile for Session Service
FROM openjdk:11

# Set working directory
WORKDIR /booking_service

COPY . .

# Build the application
RUN apt update && apt install maven -y
RUN mvn -B dependency:go-offline
RUN mvn -N io.takari:maven:wrapper
RUN mvn -B package -DskipTests
# Define environment variables
ENV POSTGRES_HOST: postgres
ENV POSTGRES_PORT: 5432
ENV POSTGRES_USER : postgres
ENV POSTGRES_PASSWORD: "postgres"
ENV POSTGRES_DB: reservations_db
ENV RABBIT_MQ_HOST: rabbitmq
ENV RABBIT_MQ_PORT: 5672
ENV RABBIT_MQ_USER: guest
ENV RABBIT_MQ_PASSWORD: guest
ENV RABBIT_MQ_QUEUE_NAME: messagequeue
ENV RABBIT_MQ_EXCHANGE: messagequeue-exchange
ENV HOTEL_SERVICE_HOST: hotel_service
ENV HOTEL_SERVICE_PORT: 8082
ENV PAYMENT_SERVICE_HOST: payment_service
ENV PAYMENT_SERVICE_PORT: 8084
ENV LOYALTY_SERVICE_HOST: loyalty_service
ENV LOYALTY_SERVICE_PORT: 8085



# Run the application
ENTRYPOINT ["/bin/bash", "-c", "java -jar ./target/*.jar"]
