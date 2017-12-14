pragma solidity ^0.4.18;

import "../../modifiers/FromContract.sol";

/**
 * @title ERC20StandardData
 * @dev Contract that manages the data for ERC20Standard contract and allows modifying data only from it.
 */
contract ERC20StandardData is FromContract {

    mapping(address => uint256) internal balances;

    mapping(address => mapping (address => uint256)) private allowed;

    uint256 private totalSupply;

    function getBalance(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function setBalance(address _owner, uint256 _value) external fromContract returns (bool success) {
        balances[_owner] = _value;
        return true;
    }

    function getAllowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

    function setAllowance(address _owner, address _spender, uint256 _amount) external fromContract returns (bool success) {
        allowed[_owner][_spender] = _amount;
        return true;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function setTotalSupply(uint256 _value) external fromContract returns (bool success) {
        totalSupply = _value;
        return true;
    }
}