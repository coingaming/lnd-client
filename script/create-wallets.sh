#!/bin/sh
set -e

. ./script/export-test-envs.sh

LND_WALLET_PASSWORD="developer"

create_wallet() {
expect <<- EOF
  spawn $1 create;
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


create_wallet "./script/lncli-merchant.sh"
create_wallet "./script/lncli-customer.sh"
