#!/bin/bash
#
# Create client certificate so we can authenticate to service
#

source settings.sh

mkdir -vp "$CLIENT_FILES_DIR"

# Create client Key without passphrase
openssl genrsa -out "$CLIENT_FILES_DIR/$CLIENT_KEY_NAME" "$CLIENT_KEY_BITS"

# Create client CSR
openssl req -new \
            -key "$CLIENT_FILES_DIR/$CLIENT_KEY_NAME" \
            -out "$CLIENT_FILES_DIR/$CLIENT_CSR_NAME" \
            -subj "/C=$CLIENT_SUB_COUNTRY/ST=$CLIENT_SUB_STATE/L=$CLIENT_SUB_LOCATION/O=$CLIENT_SUB_ORGANISATION/OU=$CLIENT_SUB_ORGANISATION_UNIT/CN=$CLIENT_SUB_COMMON_NAME/emailAddress=$CLIENT_SUB_EMAIL"

# Sign the client certificate with our CA cert.  Unlike signing our own server cert, this is what we want to do.
openssl x509 -req \
             -days "$CLIENT_CERT_EXPIRE_DAYS" \
             -in "$CLIENT_FILES_DIR/$CLIENT_CSR_NAME" \
             -CA "$CA_FILES_DIR/$CA_CERT_NAME" \
             -CAkey "$CA_FILES_DIR/$CA_KEY_NAME" \
             -set_serial 01 \
             -out "$CLIENT_FILES_DIR/$CLIENT_CERT_NAME"
