// SPDX-License-Identifier: MIT
pragma solidity >=0.8.11;

contract Test {
	function bar(uint256 frob) public pure returns (uint256) {
        uint256 baz;
        assembly {
            tstore(0, frob)
            baz := tload(0)
        }
        return baz;
    }
}
