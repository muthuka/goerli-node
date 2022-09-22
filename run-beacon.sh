cd prysm
bazel run //beacon-chain -- --goerli \
--datadir ../goerli-testnet  \
--execution-endpoint=http://localhost:8551  \
--jwt-secret=`pwd`/../jwtsecret