#!/bin/sh

echo "==============================Coverage================================="
tixdir=$out
hpcdir=$buildInputs | tr " " "\n" | grep lnd-client-0.1.0.0
hpc report --hpcdir=$hpcdir/share/hpc/vanilla/mix/lnd-client-0.1.0.0 $tixdir/share/hpc/vanilla/tix/lnd-client-test/lnd-client-test.tix
echo "==============================/Coverage================================="
