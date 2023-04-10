//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0 ;

contract LoanManagement {
    struct user {
        uint userid ;
        string name;
        uint cibilscore;
        uint password;
    }
    mapping(address => bytes32) verifyUser ;
    uint id ;
    uint public bankMoney = address(this).balance ;
    address payable contractAddr = payable(address(this));
    constructor(uint _bankMoney){
        id = 0;
        bankMoney = _bankMoney;
        payable(address(this)).transfer(_bankMoney);
    }

    fallback() external payable {}
    receive() external payable {}

    user[] users ;
    function register(string memory _name, uint _cibilscore, uint _password) public {
        users.push(user(id, _name, _cibilscore, _password));
        bytes32 temp = keccak256(abi.encodePacked(id + _cibilscore + _password));//add _name later
        verifyUser[msg.sender] = temp;
        id++;
    }
    // function askLoan(uint _amount) public {
    // } 
}

