#!/bin/bash

set -x

./bitcoin/bin/bitcoin-cli createwallet test
ADDR=$(./bitcoin/bin/bitcoin-cli getnewaddress)
ADDR_CLEAN=$(echo $ADDR | sed -e 's/\r//g')
echo ${ADDR_CLEAN}
./bitcoin/bin/bitcoin-cli generatetoaddress $1 $ADDR_CLEAN
