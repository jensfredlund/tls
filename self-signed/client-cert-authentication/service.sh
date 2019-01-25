#!/bin/bash
#
# Create server certs & keys used by Nginx
#

source settings.sh

mkdir -vp "$SERVICE_FILES_DIR"

# Create key for service
openssl genrsa -out "$SERVICE_FILES_DIR/$SERVICE_KEY_NAME" "$SERVICE_KEY_BITS"

# Create CSR for service
openssl req -new \
            -key "$SERVICE_FILES_DIR/$SERVICE_KEY_NAME" \
            -out "$SERVICE_FILES_DIR/$SERVICE_CSR_NAME" \
            -subj "/C=$SERVICE_SUB_COUNTRY/ST=$SERVICE_SUB_STATE/L=$SERVICE_SUB_LOCATION/O=$SERVICE_SUB_ORGANISATION/OU=$SERVICE_SUB_ORGANISATION_UNIT/CN=$SERVICE_SUB_COMMON_NAME/emailAddress=$SERVICE_SUB_EMAIL"

# Self sign our own service cert. This is a no-no in production.
openssl x509 -req \
             -days "$SERVICE_CERT_EXPIRE_DAYS" \
             -in "$SERVICE_FILES_DIR/$SERVICE_CSR_NAME" \
             -CA "$CA_FILES_DIR/$CA_CERT_NAME" \
             -CAkey "$CA_FILES_DIR/$CA_KEY_NAME" \
             -set_serial 01 \
             -out "$SERVICE_FILES_DIR/$SERVICE_CERT_NAME"
