#!/bin/sh
set -e

. ./script/export-test-envs.sh

LND_WALLET_PASSWORD="developer"

wait_for_rpc() {
  local STATE=`$1 state | jq .state -r`
  echo "Got '$STATE' for $1"
  if [ "$STATE" = "" ] || [ "$STATE" = "WAITING_TO_START" ]; then
    echo "Waiting $1 to start..."
    sleep 1
    wait_for_rpc "$1"
  else
    echo "Node $1 has been started"
  fi
}

create_wallet() {
wait_for_rpc "$1"
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
