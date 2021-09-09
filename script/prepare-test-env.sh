#!/bin/sh

set -e

./script/generate-tls-cert.sh
./script/reset-test-data.sh
./script/spawn-test-deps.sh
./script/create-wallets.sh

