pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BayMaxNFT is ERC721URIStorage, Ownable {
    uint256 public tokenID;

    constructor() ERC721("BayMaxNFT", "BMNFT") Ownable(msg.sender) {}

    function mint(address to) external onlyOwner {
        _mint(to, tokenID);
        tokenID++;
    }
}
