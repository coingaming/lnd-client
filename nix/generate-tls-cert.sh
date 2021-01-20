#!/bin/sh

(
  cd ./.lnd
  openssl ecparam -genkey -name prime256v1 -out tls.key
  openssl req -new -sha256 -key tls.key -out csr.csr -subj '/CN=localhost/O=lnd'
  openssl req -x509 -sha256 -days 36500 -key tls.key -in csr.csr -out tls.cert
  rm csr.csr
)
