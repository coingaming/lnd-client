#!/bin/sh

THIS_DIR="$(pwd)"

#
# bitcoind
#

export BTCD_DIR="$THIS_DIR/.bitcoin"
alias bitcoind="bitcoind -datadir=$BTCD_DIR"
alias bitcoin-cli="bitcoin-cli -datadir=$BTCD_DIR"
export BTC_RPC_USER="developer"
export BTC_RPC_PASSWORD="developer"
export BTC_RPC_URL="http://localhost:18443"
#
# lnd
#

export LND_MERCHANT_DIR="$THIS_DIR/.lnd-merchant"
alias lncli-merchant="lncli -n regtest --lnddir=$LND_MERCHANT_DIR"
export LND_CUSTOMER_DIR="$THIS_DIR/.lnd-customer"
alias lncli-customer="lncli -n regtest --lnddir=$LND_CUSTOMER_DIR --rpcserver=localhost:11009"

#
# lnd-client
#
export LND_CLIENT_ENV_DATA='
{
    "lnd_host":"localhost",
    "lnd_port":10009
}
'
export LND_CLIENT_SENSITIVE_ENV_DATA='
{
    "name":"bitcasino",
    "lnd_wallet_password":"developer",
    "lnd_tls_cert":"-----BEGIN CERTIFICATE-----\nMIIB5TCCAYugAwIBAgIQdO9Ld+VoSDTS6iCH8Q1vOTAKBggqhkjOPQQDAjA4MR8w\nHQYDVQQKExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0\nNWY0ZmIwHhcNMTkxMTI2MTAxMzE5WhcNMjEwMTIwMTAxMzE5WjA4MR8wHQYDVQQK\nExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0NWY0ZmIw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQT8jCB5MLjVgZ19RelGVgNiI2AtX9w\nd+k+EPdBn1ETVvtbtB0d21j2JYilKCwfJvTSFyEcrpSNhZPEc06RdoHRo3cwdTAO\nBgNVHQ8BAf8EBAMCAqQwDwYDVR0TAQH/BAUwAwEB/zBSBgNVHREESzBJggw3MmRl\nNDc0NWY0ZmKCCWxvY2FsaG9zdIIEdW5peIIKdW5peHBhY2tldIcEfwAAAYcQAAAA\nAAAAAAAAAAAAAAAAAYcErBEAAjAKBggqhkjOPQQDAgNIADBFAiAcgXfpsWP36e+J\nf9lsNk/4t2cUEhiP/g3zbvxPQCS4DgIhAPNO2hW1X7vyIWWfrOKawB8OzSeP9r2D\n1y1UOaK4Ps1i\n-----END CERTIFICATE-----",
    "lnd_hex_macaroon":"0201036C6E6402CF01030A10634D5C8D3227E9F63529F82690C1898E1201301A160A0761646472657373120472656164120577726974651A130A04696E666F120472656164120577726974651A170A08696E766F69636573120472656164120577726974651A160A076D657373616765120472656164120577726974651A170A086F6666636861696E120472656164120577726974651A160A076F6E636861696E120472656164120577726974651A140A057065657273120472656164120577726974651A120A067369676E6572120867656E657261746500000620EB31C7413A5A44D14705852F8C0CA399104658C40AC866918C1D4B981DF2E71E",
    "lnd_cipher_seed_mnemonic":[
                  "absent",
                  "dilemma",
                  "mango",
                  "firm",
                  "hero",
                  "green",
                  "wide",
                  "rebel",
                  "pigeon",
                  "custom",
                  "town",
                  "stadium",
                  "shock",
                  "bind",
                  "ocean",
                  "seek",
                  "enforce",
                  "during",
                  "bird",
                  "honey",
                  "enrich",
                  "number",
                  "wealth",
                  "thunder"
                  ],
    "lnd_aezeed_passphrase":"developer"
}
'
