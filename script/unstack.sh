#!/bin/sh

help_msg() {
cat << EOF
./script/unstack.sh cmd
    help - show this message
    watch - run cabal fast build in watch mode
    test - prepare test env, run tests, clean env
    clean - cleanup test env
    prepare - spawn test deps and run bitcoind and lnd
EOF
}

dev_watcher() {
    fswatcher --path src cabal build -- -j33 -fno-code --disable-optimization
}

run_tests() {
    export GODEBUG=x509ignoreCN=0
    ./script/prepare-test-env.sh
    . ./script/export-test-envs.sh
    cabal test --disable-optimization
    ./script/cleanup-test-env.sh
}

clean() {
    ./script/cleanup-test-env.sh
}

prepare() {
    ./script/prepare-test-env.sh
}

nodes_status() {
    ./script/status.sh
}

case "$1" in
    test)
        run_tests
    ;;
    watch)
       dev_watcher
    ;;
    help)
        help_msg
    ;;
    prepare)
        prepare
    ;;
    clean)
        clean
    ;;
    status)
       nodes_status
    ;;
    *)
        help_msg
        exit 1
    ;;
esac
