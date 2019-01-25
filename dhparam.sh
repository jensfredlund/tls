#!/bin/bash
#
# Create dhparam key for service
#
set -u

CERT_DIR="certs"
BITS="4096"

mkdir -vp "$CERT_DIR"

openssl dhparam -out "$CERT_DIR"/dhparam.pem "$BITS"
