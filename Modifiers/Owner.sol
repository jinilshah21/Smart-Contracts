// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Owner
 * @dev This smart contract defines ownership control, allowing a designated owner to manage the contract's funds.
 */
contract Owner {
    // The address of the contract owner, set at deployment.
    address immutable s_owner;

    /**
     * @dev Constructor to set the contract owner.
     * The deployer of the contract becomes the owner.
     */
    constructor() {
        s_owner = msg.sender;
    }

    /**
     * @dev Modifier to restrict access to the contract owner only.
     */
    modifier onlyOwner() {
        require(msg.sender == s_owner, "Not the contract owner!!");
        _;
    }

    /**
     * @dev Function to withdraw the contract's balance, accessible only by the owner.
     * The contract owner can withdraw the entire balance to their own address.
     */
    function withdraw() public onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success, "Transfer failed!");
    }

    /**
     * @dev Function to fund the contract.
     * Anyone can send Ether to this contract to increase its balance.
     */
    function fundContract() public payable {}
}
