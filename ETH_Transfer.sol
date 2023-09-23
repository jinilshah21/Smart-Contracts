// 1. Create a mapping user_account to store user balance, user as an address. Keep the mapping variable public.

// 2. Create a deposit() function to send ethers into an account created for the user.

// 3. Create a withdraw() function to withdraw ethers from the user account created in the smart contract.

// 4. Create a get_balance() function to read user balance from the smart contract.

// * the functions name should match as defined above

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    mapping(address => uint) public user_account;

    function deposit() public payable {
        user_account[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount > 0);
        require(amount <= user_account[msg.sender]);
        user_account[payable(msg.sender)] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function get_balance() public view returns (uint) {
        return user_account[msg.sender];
    }
}
