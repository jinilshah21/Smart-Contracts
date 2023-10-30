// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title FundMe
 * @dev This smart contract allows for ownership control, enabling a designated owner to manage the contract's funds.
 */
contract FundMe {
    // The address of the contract owner, set at deployment.
    address immutable public owner;

    // Mapping to track contributions by individual funders.
    mapping(address => uint256) public Funders;

    // Timestamp indicating when the contract was deployed.
    uint256 public startedAt;

    /**
     * @dev Constructor to set the contract owner and time when contract was deployed.
     * The deployer of the contract becomes the owner.
     * The deploy time becomes startedAt.
     */
    constructor() {
        owner = msg.sender;
        startedAt = block.timestamp;
    }

    /**
     * @dev Modifier to restrict access to the contract owner only.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner!!");
        _;
    }

    /**
     * @dev Function to withdraw the contract's balance, accessible only by the owner.
     * The contract owner can withdraw the entire balance to their own address.
     * 
     * @param amount The amount to withdraw from the contract.
     */
    function withdraw(uint256 amount) public onlyOwner {
        require(getContractBalance() >= amount, "There is nothing to withdraw");
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed!");
    }

    /**
     * @dev Function to fund the contract.
     * Anyone can send Ether to this contract to increase its balance.
     * If the 365 have passed the fund function closes.
     */
    function fundContract() public payable {
        require(isClosed() == false, "The Funding has been closed");
        Funders[msg.sender] += msg.value;
    }

    /**
     * @dev Function to see the balance of the contract.
     * Only the owner can see the balance of the contract.
     */
    function getContractBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    /**
     * @dev Function to retrieve the funding amount of a specific funder.
     * 
     * @param _address The address of the funder.
     * @return The amount funded by the specified address.
     */
    function getFunderAmount(address _address) public view returns (uint256) {
        require(Funders[_address] > 0, "Address not a funder");
        return Funders[_address];
    }

    /**
     * @dev Function to check if the funding is closed.
     * 
     * @return True if the contract is closed, false otherwise.
     */
    function isClosed() public view returns (bool) {
        if (startedAt + 365 days < block.timestamp) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Function to retrieve the contract's start time.
     * 
     * @return The timestamp when the contract was deployed.
     */
    function getStartTime() public view returns (uint256) {
        return startedAt;
    }
}
