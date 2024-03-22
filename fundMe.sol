// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
contract fundMe {
    modifier minimumAmount {
        require(msg.value > 1e18, "the minimum amount to send is 1 ETH");
        _;
    }
    function fund() public payable minimumAmount {

    }
}