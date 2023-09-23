// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    function compare(
        string memory s1,
        string memory s2
    ) public pure returns (bool) {
        bytes32 s11 = keccak256(abi.encodePacked(s1));
        bytes32 s22 = keccak256(abi.encodePacked(s2));
        if (s11 == s22) return true;
        return false;
    }
}
