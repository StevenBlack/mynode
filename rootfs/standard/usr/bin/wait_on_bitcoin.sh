#!/bin/bash

set -x
set -e

# Wait to see if bitcoin is synced
echo "Checking if Bitcoin is synced..."
while [ ! -f "/mnt/hdd/mynode/.mynode_bitcoin_synced" ]; do
    echo "BTC not synced, sleeping 30s"
    /bin/sleep 30s
done

# And finally, make sure bitcoin responds to API requests
bitcoin-cli -datadir=/mnt/hdd/mynode/bitcoin -rpcwait getblockchaininfo

exit 0