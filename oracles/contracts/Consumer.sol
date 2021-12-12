pragma solidity ^0.7.3;

import './IOracle.sol';

contract Consumer {
  IOracle public oracle;

  constructor(address _oracle){
    oracle = IOracle(_oracle);
  }


  // example data to fetch data from oracle
  function foo() external {
    bytes32 key = keccak256(abi.encodePacked('BTC/USD'));
  }

}