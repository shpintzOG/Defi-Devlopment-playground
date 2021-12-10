pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

// Not a useful contract
contract ERC721OpenZeppelin1 is ERC721 {
  constructor() ERC721('Token name','Token Symbol'){}
}

// Mints NFT in contructor
contract ERC721OpenZeppelin2 is ERC721 {
  constructor() ERC721('Token name','Token Symbol'){
    _safeMint(msg.sender, 0);
  }
}

// Mint in token in a dedicated function
contract ERC721OpenZeppelin3 is ERC721 {

  address public admin;

  constructor() ERC721('Token name','Token Symbol'){
    admin = msg.sender;
  }

  function mint(address to, uint tokenId) external {
    require(msg.sender == admin, 'only admin');
    _safeMint(to, tokenid);
  }

}

// create faucet for develpment
contract ERC721OpenZeppelin3 is ERC721 {
  constructor() ERC721('Token name','Token Symbol'){
    admin = msg.sender;
  }

  function faucet(address to, uint tokenId) external {
    _safeMint(to, tokenid);
  }

}