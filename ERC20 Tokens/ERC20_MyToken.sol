//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0 ;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BITStoken is ERC20 {
    uint supply ;
    address owner ;
    constructor(uint _supply) ERC20 ("Di Coin", "DC") {

         owner = msg.sender;
         supply = _supply;
    }

    function mintTokens() private {
         _mint(msg.sender, supply );
    }

    function getBalance(address addr) public view returns(uint){
         uint balance = addr.balance;
         return balance;

    }
}