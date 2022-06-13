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

export LND_MERCHANT_DIR="$THIS_DIR/.lnd-merchant"
alias lncli-merchant="lncli -n regtest --lnddir=$LND_MERCHANT_DIR --rpcserver=127.0.0.1:10009"
export LND_CUSTOMER_DIR="$THIS_DIR/.lnd-customer"
alias lncli-customer="lncli -n regtest --lnddir=$LND_CUSTOMER_DIR --rpcserver=127.0.0.1:11009"

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
    \"lnd_hex_macaroon\":\"0201036c6e6402f801030a10f65286e21207df41cc77be0175cbb2871201301a160a0761646472657373120472656164120577726974651a130a04696e666f120472656164120577726974651a170a08696e766f69636573120472656164120577726974651a210a086d616361726f6f6e120867656e6572617465120472656164120577726974651a160a076d657373616765120472656164120577726974651a170a086f6666636861696e120472656164120577726974651a160a076f6e636861696e120472656164120577726974651a140a057065657273120472656164120577726974651a180a067369676e6572120867656e6572617465120472656164000006202eba3f3acaa7a7b974fdccc7a10060ede5b4801a85661c58166b062412e92e8a\",
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




