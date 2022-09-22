cd erigon
./build/bin/erigon --chain=goerli \
--datadir ../goerli-testnet \
--authrpc.jwtsecret=../jwtsecret \
--http --http.api=engine,net,eth