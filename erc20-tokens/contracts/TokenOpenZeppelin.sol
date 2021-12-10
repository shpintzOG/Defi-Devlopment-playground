pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

// Creating a token
contract TokenOpenZeppelin1 is ERC20{
  constructor() ERC20('Token Name', 'Token_Ticker'){}
}

// Creating and minting the token to the address of the sender
contract TokenOpenZeppelin2 is ERC20{
  constructor() ERC20('TokenName','TokenTicker'){
    _mint(msg.sender, 29000000);
  }
}

// Creating an admin to recieve tokens
contract TokenOpenZeppelin3 is ERC20{
  address public admin;

  constructor() ERC20('Token Name', 'Token_Ticker'){
    admin = msg.sender;
  }

  function mint(address to, uint amount) external {
    require(msg.sender == admin, 'only admin');
    _mint(to, amount);
  }

}

// Creating a faucet
contract TokenOpenZeppelin3 is ERC20{
  constructor() ERC20('Token Name', 'Token_Ticker'){}

  function faucet(address to, uint amount) external {
    _mint(to, amount);
  }

}
