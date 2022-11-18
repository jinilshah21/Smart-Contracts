// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
contract PrivPublVisibility {

    uint num1; //private variable
    uint public num2 ; //public variable
    uint private num3 ; //private variable
    constructor(){// constructor to set initial values of variables
        num1 = 1;
        num2 = 2;
        num3 = 3;
    }
    function setValueNum1(uint _num1) public{// setter function to change value of num1
        num1 = _num1 ;
    }
    function setValueNum2(uint _num2) public{
        num2 = _num2 ;
    }
    function setBValueNum3(uint _num3) private{
        num3 = _num3 ;
    }
    function getValueNum1() public view returns(uint){
        return num1;
    }
     function getValueNum3() public view returns(uint){
        return num3;
    }
}