//SPDX-License-Identifier: Unlicensed
import "../../IDO.sol";
import "./IIDOWithWhitelist.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
pragma solidity ^0.8.0;
abstract contract IDOWithWhitelist is IIDOWithWhitelist, IDO, AccessControlEnumerable {
    bytes32 public override WHITELISTER_ROLE = keccak256("WHITELISTER_ROLE");
    bytes32 public override WHITELISTED_ROLE = keccak256("WHITELISTED_ROLE");
    function _beforeContribution(address addr, uint) internal view override {
        require(hasRole(WHITELISTED_ROLE, addr), "User has not been whitelisted.");
    }
}