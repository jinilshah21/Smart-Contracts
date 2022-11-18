// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
contract functions {
    //there are two types of functions or methods
    uint value1 ; //by default it is has private visibility
    uint public value2 ;
    uint private value;
    constructor (){
        value = 0;
        value1 = 1;
        value2 = 1;
    }
    // 1 setter functions 
    function setValue( uint _value1 , uint _value2) public {
        value1 = _value1 ;
        value2 = _value2;
        value += value1 + value2;
    }
    // 2 getter functions 
    function getValue() public view returns(uint){
        return value;
    }
}