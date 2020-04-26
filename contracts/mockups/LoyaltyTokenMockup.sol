pragma solidity ^0.5.1;

import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20.sol";
import "@nomiclabs/buidler/console.sol";

contract LoyaltyTokenMockup {
    using SafeMath for uint256;

    mapping (address => uint256) balances;

    function mintLoyaltyTokens(address _owner, uint256 _amount) public {
        balances[_owner] = balances[_owner].add(_amount);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        if ( balances[msg.sender] >= _amount) { 
            balances[msg.sender] = balances[msg.sender].sub(_amount);
            balances[_to] = balances[_to].add(_amount);
            return true;
        }
       else {
            return false;
        }
    }

    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
        if ( balances[_from] >= _amount) {
            balances[_from] = balances[_from].sub(_amount);
            balances[_to] = balances[_to].add(_amount);
            return true;
        }
        
    }

}