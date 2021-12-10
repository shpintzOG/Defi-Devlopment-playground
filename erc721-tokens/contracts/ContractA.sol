pragma solidity ^0.7.3;
//  recive nft from other address or contract and send 

// Need this to recieve token
import 'openzeppelin/contracts/token/ERC721/ERC721Holder.sol';
// interface to interact with erc721 token
import 'openzeppelin/contracts/token/ERC721/IERC721.sol';

// Going to be recipient of ERC721 holder
contract ContractB {
  function deposit(uint tokenId) external;
  function withdrawl(uint tokenId) external;
}

contract ContractA is ERC721Holder {
  IERC721 public token;
  ContractB public contractB;

  constructor(address _token, address _contractB){
    token = IERC721(_token);

    contractB = ContractB(_contractB);
  }

  // Going to need to approve contract to deposit
  function deposit(uint tokenId) external {
    token.safeTransferFrom(msg.sender, address(this), tokenId);
    token.approve(address(contractB), tokenId);
    contractB.deposit(tokenId);
  }

  function withdrawl(uint tokenId) external {
    contractB.withdrawl(tokenId);
    token.safeTransferFrom(address(this), msg.sender, tokenId);
  }

}