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
    ./script/prepare-test-env.sh
    cabal test
    ./script/cleanup-test-env.sh
}

clean() {
    ./script/cleanup-test-env.sh
}

prepare() {
    ./script/prepare-test-env.sh
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
    *)
        help_msg
        exit 1
    ;;
esac
