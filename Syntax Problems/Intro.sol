// SPDX-License-Identifier: MIT

pragma solidity 0.8.0 ;

contract sendAndRecieveETH {
    address public owner ;
    constructor(){
        owner = msg.sender;
    }
    receive() external payable {

    }
    fallback() external payable {

    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    
    
    function sendEth(address payable recipient , uint value) public returns(bool){
        require (owner == msg.sender ,"Transaction randi");
        if (value <= getBalance()) {
            recipient.transfer(value);
            return true;
        }
        else 
        return false;
    }
    
}