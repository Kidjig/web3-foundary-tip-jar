// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TipJar {
    address public owner;
    uint256 public totalTips;
    mapping(address => uint256) public tips;

    event TipReceived(address indexed tipper, uint256 amount);
    event TipWithdrawn(address indexed owner, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function tip() public payable {
        require(msg.value > 0, "Tip amount must be greater than 0");
        tips[msg.sender] += msg.value;
        totalTips += msg.value;
        emit TipReceived(msg.sender, msg.value);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        uint256 amount = address(this).balance;
        require(amount > 0, "No tips to withdraw");
        
        (bool sent, ) = owner.call{value: amount}("");
        require(sent, "Failed to send Ether");
        
        totalTips = 0;
        emit TipWithdrawn(owner, amount);
    }

    function getMyTips() public view returns (uint256) {
        return tips[msg.sender];
    }
}