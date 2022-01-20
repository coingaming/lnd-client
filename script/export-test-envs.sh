#!/bin/sh

THIS_DIR="$(pwd)"

#export GODEBUG=x509ignoreCN=0

#
# bitcoind
#

export BTCD_DIR="$THIS_DIR/.bitcoin"
alias bitcoind="bitcoind -datadir=$BTCD_DIR"
alias bitcoin-cli="bitcoin-cli -datadir=$BTCD_DIR"

#
# lnd
#

export LND_ALICE_DIR="$THIS_DIR/.lnd-alice"
alias lncli-alice="lncli -n regtest --lnddir=$LND_ALICE_DIR --rpcserver=127.0.0.1:10009"

export LND_BOB_DIR="$THIS_DIR/.lnd-bob"
alias lncli-bob="lncli -n regtest --lnddir=$LND_BOB_DIR --rpcserver=127.0.0.1:11009"

export LND_NICK_DIR="$THIS_DIR/.lnd-nick"
alias lncli-nick="lncli -n regtest --lnddir=$LND_NICK_DIR --rpcserver=127.0.0.1:12009"

#
# lnd-client
#

#export GRPC_VERBOSITY=debug
export LND_TLS_CERT="$(cat "$THIS_DIR/.lnd/tls.cert" | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')"
export LND_CLIENT_ENV_DATA="
{
    \"name\":\"bitcasino\",
    \"lnd_wallet_password\":\"developer\",
    \"lnd_tls_cert\":\"$LND_TLS_CERT\",
    \"lnd_hex_macaroon\":\"0201036C6E6402CF01030A10634D5C8D3227E9F63529F82690C1898E1201301A160A0761646472657373120472656164120577726974651A130A04696E666F120472656164120577726974651A170A08696E766F69636573120472656164120577726974651A160A076D657373616765120472656164120577726974651A170A086F6666636861696E120472656164120577726974651A160A076F6E636861696E120472656164120577726974651A140A057065657273120472656164120577726974651A120A067369676E6572120867656E657261746500000620EB31C7413A5A44D14705852F8C0CA399104658C40AC866918C1D4B981DF2E71E\",
    \"lnd_host\":\"127.0.0.1\",
    \"lnd_port\":10009,
    \"lnd_cipher_seed_mnemonic\":[
                  \"absent\",
                  \"dilemma\",
                  \"mango\",
                  \"firm\",
                  \"hero\",
                  \"green\",
                  \"wide\",
                  \"rebel\",
                  \"pigeon\",
                  \"custom\",
                  \"town\",
                  \"stadium\",
                  \"shock\",
                  \"bind\",
                  \"ocean\",
                  \"seek\",
                  \"enforce\",
                  \"during\",
                  \"bird\",
                  \"honey\",
                  \"enrich\",
                  \"number\",
                  \"wealth\",
                  \"thunder\"
                  ],
    \"lnd_aezeed_passphrase\":\"developer\",
    \"lnd_sync_grpc_timeout_seconds\":59,
    \"lnd_log_severity\":\"debug\"
}
"

# \"lnd_log_meta\":[\"LndHost\"],
# \"lnd_log_severity\":\"emergency\"

export GODEBUG=x509ignoreCN=0
