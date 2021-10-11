#!/bin/sh
set -e

(
  cd ./.lnd
  openssl ecparam -genkey -name prime256v1 -out tls.key
  openssl req -new -sha256 -key tls.key -out csr.csr -subj '/CN=127.0.0.1/O=lnd' -addext 'subjectAltName = IP:127.0.0.1'
  openssl req -x509 -sha256 -days 36500 -key tls.key -in csr.csr -out tls.cert -addext 'subjectAltName = IP:127.0.0.1'
  rm csr.csr
)
