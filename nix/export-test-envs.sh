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
# app
#

export  LND_CLIENT_LND_WALLET_PASSWORD="developer";

export  LND_CLIENT_LND_TLS_CERT="
-----BEGIN CERTIFICATE-----
MIIB5TCCAYugAwIBAgIQdO9Ld+VoSDTS6iCH8Q1vOTAKBggqhkjOPQQDAjA4MR8w
HQYDVQQKExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0
NWY0ZmIwHhcNMTkxMTI2MTAxMzE5WhcNMjEwMTIwMTAxMzE5WjA4MR8wHQYDVQQK
ExZsbmQgYXV0b2dlbmVyYXRlZCBjZXJ0MRUwEwYDVQQDEww3MmRlNDc0NWY0ZmIw
WTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQT8jCB5MLjVgZ19RelGVgNiI2AtX9w
d+k+EPdBn1ETVvtbtB0d21j2JYilKCwfJvTSFyEcrpSNhZPEc06RdoHRo3cwdTAO
BgNVHQ8BAf8EBAMCAqQwDwYDVR0TAQH/BAUwAwEB/zBSBgNVHREESzBJggw3MmRl
NDc0NWY0ZmKCCWxvY2FsaG9zdIIEdW5peIIKdW5peHBhY2tldIcEfwAAAYcQAAAA
AAAAAAAAAAAAAAAAAYcErBEAAjAKBggqhkjOPQQDAgNIADBFAiAcgXfpsWP36e+J
f9lsNk/4t2cUEhiP/g3zbvxPQCS4DgIhAPNO2hW1X7vyIWWfrOKawB8OzSeP9r2D
1y1UOaK4Ps1i
-----END CERTIFICATE-----
";

export  LND_CLIENT_LND_TLS_KEY="
-----BEGIN EC PRIVATE KEY-----
MHcCAQEEILSsaTgXFhH5si0FmOvThK7ovOolEkYGDJeWJ32eOQCkoAoGCCqGSM49
AwEHoUQDQgAEE/IwgeTC41YGdfUXpRlYDYiNgLV/cHfpPhD3QZ9RE1b7W7QdHdtY
9iWIpSgsHyb00hchHK6UjYWTxHNOkXaB0Q==
-----END EC PRIVATE KEY-----
";

export LND_CLIENT_LND_HEX_MACAROON="0201036C6E6402CF01030A10634D5C8D3227E9F63529F82690C1898E1201301A160A0761646472657373120472656164120577726974651A130A04696E666F120472656164120577726974651A170A08696E766F69636573120472656164120577726974651A160A076D657373616765120472656164120577726974651A170A086F6666636861696E120472656164120577726974651A160A076F6E636861696E120472656164120577726974651A140A057065657273120472656164120577726974651A120A067369676E6572120867656E657261746500000620EB31C7413A5A44D14705852F8C0CA399104658C40AC866918C1D4B981DF2E71E";

export LND_CLIENT_LND_URL="https://localhost:8080";
export LND_CLIENT_LND_HOST="localhost";
export LND_CLIENT_LND_PORT="10009";
export LND_CLIENT_ENV="dev";
export LND_CLIENT_LOG_FORMAT="Bracket"; # Bracket | JSON

# openssl genrsa -out ./key.pem 2048 dgst -sha256
export LND_CLIENT_SERVER_PRIVATE_RSA_PEM="
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAn+s8lbOMAeR6k8CBLyzcZdTdacdIrFymwzdMmmMtYnp7ZmVZ
vErPlIAO36s0BYyI53TD4j7CoRwfCbie4TVp2ka3J/gkT8Skkt47JokEvoh2OlyR
zjn3S5ZkamgMcV3bsHxI2nWJRksNQ4/Wgv1pjRSSh+Eken4TgcraMDTvi2sdl/pI
6RmHgMXxWvtTczyOyKpQz/hn7G7j61ICZCw95UQdQwIb0/r93EyTABiv0JtPNPTj
qb0rQSxjRA6ss0nb24+gdZPZo8tXKTpgqKaFkhvxOOesR4feTh1oQmHTQ8V2Symv
zFBpxGkJoMuI6+fzIhR/H5YppKFa+VV3NEnYSwIDAQABAoIBAEcuWto7f/87pr/r
eNT5v+RnumIh/RwTZXsROzyhFot1/0VVqXqhRgJQec5fExnBMxLrK2GiE9nIfZxD
HB0cPFCXF2FoFymWWrawyl1dscnpTc6uc4v6yzNO7sVaKOexIl9NAtSSapbqQy4m
cRH/ICNW2941fZo0UhR8qV+5wEIqqGBp1TT4LPw/9vlfwupS1Uht0uwDMsTBiyd1
BM/vt8Q4CV+OrVubCdIwroolQHfMF7G+8l+JvVKAWfvJ6a8X4bc45bSIT9EsN9MB
pVPF4HGW4jfrgVXty5LHMG9fENaedDsDwDfOEcy3tDv/SMJ4RvTlaJ4bzx/7zUkC
LaQQW2ECgYEA0CGAwUm4hWK52ywyIAPL3YfYLE3itGzJ0hVEpH38I94eFRsTLbMU
OkGrfbiktuRNbmkDdzZCx8WOxS8sIOodyVqvP7mf3s79umQqanHPWNzKnx0T6EOb
71DJSkpM9m6y421ahpx4ReLO26fVNRPaWqGpVVyJNT3qtzzQo80P19ECgYEAxLMR
7zAf0B4gaxYF2SPUbKrv9/aiuNfvj03m/xgb5vz6pc8Im+n6jwInRKBT6Kk3ftMZ
OJTlPpQPLDAA0Yt/1t7lO0ZvheOSlgumrNO09KuikbM9O0Hytn6UywqPG7SHeB0T
DHnrK24rUtepgYY8UsRtm2nL7HX+KQsGAB0vUVsCgYBmJutw8uPz477gydJYUESx
GEmLhTat428zA2lLauJkIFKXfVBub6SP60dmT0fY1DkE5dnjmugv8NDgCwUXqpCw
EShOmKbUzrdN0nfXAsEIFmYErlrk9roEPZxuMAWSNkbqxPNXeli1xFpPCRLmGDZl
oU7hLKfTT+5xvRGSM8WA4QKBgGlE9Lov5Ta6iNsGxEZ7mHo32Ym5Y0jNuBXXuWKY
goZSqcoHTTI0PLZAjsd5jq6bsWmcjIjtluqwzpX1ctqyb86NJ91bSuA69P58ac1g
2B2BpdWYOZL3LnBguj0X/5LyQPYViVZKAYQSx/jkFoGNV8dr/MUKD+sTEtzgW2vA
Msy1AoGAHJ2wzkDbb4ZkkhC3bLoH4N8fK9oeFFAYZqFbwe1LOQgZoxlkqoh82Vpl
X+eUIBFY7A1LTXtUOB4npY//vLXexXFFph3og9pWUmDu686lIGC9Tb+FrpJ3iI0H
kHG+/UkZqjEhgdQedHtMaCc584s3bUTT2wNBYVwkGsLgFZuhTRE=
-----END RSA PRIVATE KEY-----
";

# sudo ssh-keygen -f key.pem -y > key.pem.pub
export LND_CLIENT_CLIENT_PUBLIC_RSA_PEM="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCf6zyVs4wB5HqTwIEvLNxl1N1px0isXKbDN0yaYy1ientmZVm8Ss+UgA7fqzQFjIjndMPiPsKhHB8JuJ7hNWnaRrcn+CRPxKSS3jsmiQS+iHY6XJHOOfdLlmRqaAxxXduwfEjadYlGSw1Dj9aC/WmNFJKH4SR6fhOBytowNO+Lax2X+kjpGYeAxfFa+1NzPI7IqlDP+GfsbuPrUgJkLD3lRB1DAhvT+v3cTJMAGK/Qm0809OOpvStBLGNEDqyzSdvbj6B1k9mjy1cpOmCopoWSG/E456xHh95OHWhCYdNDxXZLKa/MUGnEaQmgy4jr5/MiFH8flimkoVr5VXc0SdhL";
