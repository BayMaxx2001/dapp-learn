// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {TaFi} from "./TaFi.sol";
import {BayMaxNFT} from "./BayMaxNFT.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Market is Ownable {
    BayMaxNFT public nft;
    uint256 public price;
    TaFi public tafi;

    constructor() Ownable(msg.sender) {
        nft = new BayMaxNFT();
        tafi = new TaFi();
        price = 1 * 10 ** 18;
    }

    function buy() external {
        require(
            tafi.transferFrom(msg.sender, address(this), price),
            "Payment failed"
        );
        uint256 tokenId = getNextTokenId();
        nft.transferFrom(owner(), msg.sender, tokenId);
    }

    function getNextTokenId() internal view returns (uint256) {
        return nft.tokenID() - 1;
    }
}
