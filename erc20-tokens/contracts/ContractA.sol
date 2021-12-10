pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

// Going to transfer tokens to other smart contract - functions are from other contract
interface ContractB{
  function deposit(uint amount) external;
  function withdraw(uint amount) external;
}

contract ContractA {
  IERC20 public token;
  ContractB public contractB;

  constructor(address _token, address _contractB){
    token = IERC20(_token);
    contractB = ContractB(_contractB);
  }

  // Send to contract - person needs to apporove function call first
  function deposit(uint amount) external {
    token.transferFrom(msg.sender, address(this), amount);
    token.approve(address(contractB), amount);
    contractB.deposit(amount);
  }

  // Withdraw to original address
  function withdraw(uint amount) external {
    contractB.withdraw(amount);
    token.transfer(msg.sender, amount);
  }

}