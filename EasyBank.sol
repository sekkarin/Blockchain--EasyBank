// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract EasyBank {
    mapping(address => uint256) public balances;
    address public owner;
    // log
    event LogDepositMade(address indexed accountAddress, uint256 amount);

    constructor() payable {
        // require(msg.value == 30 ether, "30 ether initial funding required");
        owner = msg.sender;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function deposit(uint256 money) public payable returns (uint256) {
        balances[msg.sender] = money;
        emit LogDepositMade(msg.sender, money);
        return balances[msg.sender];
    }

    function withdraw(uint256 withdrawAmount) public returns (uint256) {
        if (withdrawAmount <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmount;
        }
        return balances[msg.sender];
    }
}
