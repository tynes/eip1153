#!/bin/bash

if [ ! -f $1 ]; then
    echo "$1 file not found"
    exit 1
fi

BIN=$(./solidity/build/solc/solc --bin $1 2>/dev/null | grep 60)

node -e '
const ethers = require("ethers");
const JsonRpcSigner = ethers.providers.JsonRpcSigner;
const JsonRpcProvider = ethers.providers.JsonRpcProvider;

const calldata = "'$BIN'";

(async () => {
  const provider = new JsonRpcProvider("http://127.0.0.1:8545");
  const signer = provider.getSigner(0);

  const tx = await signer.sendTransaction({
    to: null,
    data: "0x" + calldata,
  });

  const receipt = await tx.wait();
  console.log(receipt);
})().catch((err) => {
  console.log(err);
  process.exit(1);
});
'
