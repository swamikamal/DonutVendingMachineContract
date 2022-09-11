// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract VendingMachine {
    address public owner;
    mapping (address => uint) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)]=100;
    }

    function getVendingBalance() public view returns(uint){
        return donutBalances[address(this)];
    }

    function restock(uint amount) public {
        require(msg.sender == owner, "YOu are Not the owner");
        donutBalances[address(this)] += amount;
        
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount*2 ether, "pay more");
        require(donutBalances[address(this)] >= amount, "not enought donuts to purchase");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }

}
