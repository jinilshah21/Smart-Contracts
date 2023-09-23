// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract LCM {
    //this function calculates the LCM
    function lcm(uint a, uint b) public pure returns (uint) {
        uint big = 0;
        uint small = 0;
        if (a >= b) {
            big = a;
            small = b;
        } else {
            big = b;
            small = a;
        }
        for (uint i = big; ; i += big) {
            if (i % small == 0) {
                return i;
            }
        }
        return 1;
    }
}
