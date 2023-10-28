// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Test {

  string[] public element = [ "first", "second", "third"];

  function memory_function() public view{
      string[] memory s1 = element;
      s1[0] = "mem_changed";
  }

  function storage_function() public{
      string[] storage s1 = element;
      s1[0] = "store_changed";
  }

}

/*When you use the memory_function() first element of the array
 won't change but when you use storage_function() first element 
 of the array will change to "store_changed".*/