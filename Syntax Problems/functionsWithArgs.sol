// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract funWithArgs {
    uint public varr ;
    address public owner = msg.sender;
    string public str = "abc ";

   
    //function will change value of varr and str and owner of contract 
    function changeVal (uint changedVar ,  address changeOwner , string memory changeStr) public{
        varr = changedVar;
        owner = changeOwner;
        str = changeStr;
    }

 
}