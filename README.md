# Running Goerli

This guide helps you setup Goerli, a testnet for ETH, to be setup.

## Requirements

* Apple Macbook Pro
* 1TB HDD
* 32 GB RAM
* Apple macos 12+
* Go 1.19+
* Bazel <https://bazel.build/install/os-x> 5.3+

## Steps

1. Create a folder for the whole project (e.g goerli/)
2. Create JWT token for nodes

    ``` sh
    openssl rand -hex 32 | tr -d "\n" > ./jwtsecret 
    ```

3. Build execution client (e.g erigon)

    ``` sh
    git clone -b alpha https://github.com/ledgerwatch/erigon
    cd erigon
    make erigon rpcdaemon
    ```

4. Run Execution Client

    ``` sh
    ./build/bin/erigon --chain=goerli \
    --datadir ../goerli-testnet \
    --authrpc.jwtsecret=../jwtsecret \
    --http --http.api=engine,net,eth
    ```

5. Build Consensus client (e.g Prysm)

    ``` sh
    git clone -b develop https://github.com/prysmaticlabs/prysm.git
    cd prysm
    bazel build //beacon-chain:beacon-chain
    cd ..
    ```

6. Start the beacon client

    ``` sh
    bazel run //beacon-chain -- --goerli \
    --datadir ../goerli-testnet  \
    --execution-endpoint=http://localhost:8551  \
    --jwt-secret=`pwd`/../jwtsecret
    ```
