// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;
contract A{
    uint public a = 20;
}
contract B is A{
    function setvalue() public{
        a = 10;
    }
    uint b = 400;
}
contract C is B {
    function reset() public{
        a = b;
    }
}