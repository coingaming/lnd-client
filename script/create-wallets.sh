#!/bin/sh

source ./script/export-test-envs.sh

LND_WALLET_PASSWORD="developer"

mlcli() {
  ./script/lncli-merchant.sh "$@"
}

clcli() {
  ./script/lncli-customer.sh "$@"
}

export -f mlcli
export -f clcli

create_wallet() {
expect <<- EOF
  spawn bash -c "$1 create";
  expect "Input wallet password: ";
  send "$LND_WALLET_PASSWORD\r";
  expect "Confirm password: ";
  send "$LND_WALLET_PASSWORD\r";
  expect "Do you have";
  send "n\r";
  expect "Input your passphrase if ";
  send "\r";
  expect "lnd successfully initialized!";
  sleep 2;
  interact;
EOF
}


create_wallet mlcli
create_wallet clcli