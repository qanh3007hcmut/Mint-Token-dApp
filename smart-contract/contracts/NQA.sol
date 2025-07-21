// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NQA is ERC20, Ownable {
    uint256 public maxTotalSupply;

    event CapIncreased(uint256 newCap);
    event TokenMinted(uint256 amount);
    event TokenBurned(uint256 amount);

    constructor(uint256 initialCap) ERC20("Nguyen Quoc Anh", "NQA") Ownable(msg.sender) {
        require(initialCap > 0, "Initial Cap must be greater than 0");
        maxTotalSupply = initialCap;
        uint256 initialToken = initialCap/10; // Mint 10% Cap to owner
        _mint(msg.sender, initialToken); // Mint initial supply to owner
    }

    /// @notice Ràng buộc số lượng mint không vượt quá tổng cung cho phép
    modifier withinSupplyCap(uint256 amount) {
        require(totalSupply() + amount <= maxTotalSupply, "Exceeds max total supply");
        _;
    }

    /// @notice Mint thêm token (chỉ owner, có giới hạn)
    function mint(address to, uint256 amount) public onlyOwner withinSupplyCap(amount) {
        _mint(to, amount);
        emit TokenMinted(amount);
    }

    /// @notice Burn token từ owner
    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
        emit TokenBurned(amount);
    }

    /// @notice Tăng giới hạn tổng cung (chỉ owner)
    function setMaxTotalSupply(uint256 newCap) external onlyOwner {
        require(newCap >= totalSupply(), "New cap must be >= current supply");
        maxTotalSupply = newCap;
        emit CapIncreased(newCap);
    }
}
