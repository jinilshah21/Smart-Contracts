// Solidity program to demonstrate 
// Push operation
pragma solidity ^0.5.0;  
   
// Creating a contract 
contract PushOperation {  
  
    // Defining dynamic the array 
    uint[] num = [10, 20, 30, 40, 50]; 
    
    // Defining the function to push 
    // values to the array
    function pushOperation(
    ) public returns(uint[] memory){  
    
        num.push(12);  
        num.push(0);  
        num.push(845);
    
        return num;  
    }  
}
