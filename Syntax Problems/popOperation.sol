
// Solidity program to demonstrate
// Pop operation
pragma solidity ^0.5.0;  
    
// Creating a contract
contract popOperation {  
  
    // Defining a dynamic array
    uint[] num 
      = [10, 20, 30, 40, 50];
    
    // Defining a function to 
    // pop values from the array
    function PopOperation(
    ) public returns(uint[] memory){  
        num.pop(); 
        return num;  
    }  
}

