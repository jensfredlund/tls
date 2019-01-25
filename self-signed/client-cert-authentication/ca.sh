#!/bin/bash
#
# Create CA certs
#

source settings.sh

mkdir -vp "$CA_FILES_DIR"

# Create the CA Key without passphrase
openssl genrsa -out "$CA_FILES_DIR/$CA_KEY_NAME" "$CA_KEY_BITS"

# Create CA certificate
openssl req -new \
            -x509 \
            -days "$CA_CERT_EXPIRE_DAYS" \
            -key "$CA_FILES_DIR/$CA_KEY_NAME" \
            -out "$CA_FILES_DIR/$CA_CERT_NAME" \
            -subj "/C=$CA_SUB_COUNTRY/ST=$CA_SUB_STATE/L=$CA_SUB_LOCATION/O=$CA_SUB_ORGANISATION/OU=$CA_SUB_ORGANISATION_UNIT/CN=$CA_SUB_COMMON_NAME/emailAddress=$CA_SUB_EMAIL"
