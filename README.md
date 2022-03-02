# eip 1153

Instructions on how to spin up your own ephemeral EIP 1153
enabled geth node. Compile contracts with a solc fork that
supports yul functions for `TSTORE` and `TLOAD` so that
its easy for developers to test out the possibilities.

```bash
$ git submodule init
$ git submodule update
```

To build and start geth:

```bash
$ cd go-ethereum
$ make geth
$ ./build/bin/geth \
    --http \
    --http.api web3,eth,debug,personal,net \
    --vmdebug \
    --dev
```

To compile a file:

```bash
$ cd solidity
$ CI=x ./scripts/build.sh
$ ./build/solc/solc --bin TestYul.sol
```

A helper script is provided to compile and deploy
a file. Note that this script will only work for
simple, single contract files. More complex deployments
will need to link the provided `solc` to their deployment
setup.

Depends on `node` and `ethers`. Pass the path to
a file as the first argument to `deploy.sh`
to deploy to the local `geth` node.

```bash
$ npm installl
$ ./deploy.sh Test.sol
```

Test that it works using `seth`. The contract
address is printed in the output of `deploy.sh`.

```bash
$ seth call <contract address> 'bar(uint256)(uint256)' 100
```
