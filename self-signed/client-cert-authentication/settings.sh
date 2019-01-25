#!/bin/bash
#
# Settings file
# 
# Run scripts in this order:
#
# 1. ./ca.sh
# 2. ./service.sh
# 3. ./client.sh

###
# CA
###
CA_FILES_DIR="certs/ca"
CA_KEY_NAME="ca.key"
CA_KEY_BITS="2048"
CA_CERT_NAME="ca.crt"
CA_CERT_EXPIRE_DAYS="365"
CA_SUB_COUNTRY="SE"
CA_SUB_STATE="Stockholm"
CA_SUB_LOCATION="Stockholm"
CA_SUB_ORGANISATION="My company"
CA_SUB_ORGANISATION_UNIT="IT"
CA_SUB_COMMON_NAME="example.com"
CA_SUB_EMAIL="hostmaster@example.com"

###
# Service
###
SERVICE_FILES_DIR="certs/service"
SERVICE_KEY_NAME="example.com.key"
SERVICE_KEY_BITS="2048"
SERVICE_CSR_NAME="example.com.csr"
SERVICE_CERT_NAME="example.com.crt"
SERVICE_CERT_EXPIRE_DAYS="365"
SERVICE_SUB_COUNTRY="SE"
SERVICE_SUB_STATE="Stockholm"
SERVICE_SUB_LOCATION="Stockholm"
SERVICE_SUB_ORGANISATION="My company"
SERVICE_SUB_ORGANISATION_UNIT="IT"
SERVICE_SUB_COMMON_NAME="example.com"
SERVICE_SUB_EMAIL="hostmaster@example.com"

###
# Client
###
CLIENT_FILES_DIR="certs/client"
CLIENT_KEY_NAME="client.key"
CLIENT_KEY_BITS="2048"
CLIENT_CSR_NAME="client.csr"
CLIENT_CERT_NAME="client.crt"
CLIENT_CERT_EXPIRE_DAYS="365"
CLIENT_SUB_COUNTRY="SE"
CLIENT_SUB_STATE="Stockholm"
CLIENT_SUB_LOCATION="Stockholm"
CLIENT_SUB_ORGANISATION="My company"
CLIENT_SUB_ORGANISATION_UNIT="IT"
CLIENT_SUB_COMMON_NAME="example.com"
CLIENT_SUB_EMAIL="hostmaster@example.com"
