// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;
//smart contract to send and recieve eth from external addresses
contract MappingTut {

    string private user ;
    address private id ; 

    constructor() {
        id = msg.sender;
    }

    mapping (string => address) verify ;
    mapping (address => string) verifyByAdder;

    function register(string memory _user , address _ID) public {
        verify[_user] = _ID;
        verifyByAdder[_ID] = _user ; 
    }

    function verifyById(string memory _verifyID) public view returns(address){
        return verify[_verifyID];
    }

     function verifyByAddress(address _iid) public view returns(string memory){
        return verifyByAdder[_iid];
    }




}

