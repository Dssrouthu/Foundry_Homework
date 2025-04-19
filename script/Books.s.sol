// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../src/Books.sol";
import "forge-std/Script.sol";

contract DeployBooks is Script {
    function run() public {
        vm.startBroadcast();
        new Books("Programming Foundry", "Sampath Routhu", 100);
        vm.stopBroadcast();
    }
}
