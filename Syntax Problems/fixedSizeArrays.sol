// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract arrays {
    //declaring a fixed size array of size 3 
    uint[3] public numbers = [2, 3, 4];
    //declared a fixed array of 4 elements
    uint [4] public num ;
    //update value of mentioned index of array numbers and shifting the old values 
    //to new array num.
    function changeNum (uint index , uint input) public {
        require(index < 4);
        num[index] = numbers[index];
        numbers[index] = input;
    }
}