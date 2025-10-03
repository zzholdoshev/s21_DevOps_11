#!/bin/bash
sudo docker build -t booking_service:local ./services/booking-service
sudo docker build -t gateway_service:local ./services/gateway-service
sudo docker build -t hotel_service:local ./services/hotel-service
sudo docker build -t loyalty_service:local ./services/loyalty-service
sudo docker build -t payment_service:local ./services/payment-service
sudo docker build -t report_service:local ./services/report-service
sudo docker build -t session_service:local ./services/session-service

