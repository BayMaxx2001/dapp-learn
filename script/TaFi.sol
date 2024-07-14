// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TaFi} from "../src/TaFi.sol";
import {BayMaxNFT} from "../src/BayMaxNFT.sol";
import {Market} from "../src/Market.sol";

contract TaFiScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        TaFi tafi = new TaFi();
        BayMaxNFT nft = new BayMaxNFT();
        Market market = new Market();

        vm.stopBroadcast();
    }
}
