pragma solidity ^0.5.1;

import "@nomiclabs/buidler/console.sol";

interface IWildCardSteward
{
    function withdrawBenefactorFundsTo(address payable benefactor) external;
    function _collectPatronagePatron(address tokenPatron) external;
    function currentPatron(uint tokenId) external returns (address);
}