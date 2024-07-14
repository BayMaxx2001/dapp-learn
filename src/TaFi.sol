// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TaFi is ERC20, Ownable {
    address public minter;

    event sent(address from, address to, uint amount);

    constructor() ERC20("TAFI Token", "TAFI") Ownable(msg.sender) {
        minter = msg.sender;
        _mint(msg.sender, 500 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == minter);
        _mint(to, amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }
}
