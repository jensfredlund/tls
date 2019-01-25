#!/bin/bash
#
# Generate self signed key & certificate without passphrase for dev testing service
#
set -u

CERT_DIR="certs"
KEY_BITS="2048"
EXPIRE_DAYS="3650"

# Subject
COUNTRY="SE"
STATE="Stockholm"
LOCATION="Stockholm"
ORGANISATION="My company"
ORGANISATION_UNIT="IT"
COMMON_NAME="example.com"
EMAIL="example.com"

mkdir -vp "$CERT_DIR"

openssl req -x509 \
            -newkey rsa:"$KEY_BITS" \
            -keyout "$CERT_DIR/$COMMON_NAME".key \
            -out "$CERT_DIR/$COMMON_NAME".crt \
            -days "$EXPIRE_DAYS" \
            -nodes \
            -subj "/C=$COUNTRY/ST=$STATE/L=$LOCATION/O=$ORGANISATION/OU=$ORGANISATION_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
