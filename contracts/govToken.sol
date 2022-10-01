// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/draft-ERC721Votes.sol";

contract govToken is ERC721, EIP712, ERC721Votes {
    constructor() ERC721("Chilis", "CHL") EIP712("Chilis", "1") {}

    uint256 public constant s_MAX_MINT = 7;
    uint256 public constant s_MAX_SUPPLY = 333;
    uint256 internal _totalSupply;

    function totalSupply() public view returns(uint256) {
        return _totalSupply;
    }

    function mint(uint256 _numberToken) public returns (bool){
        if (totalSupply() <= s_MAX_SUPPLY) {
            _mintVago(_numberToken,msg.sender);
        }
        return true;
    }

    function _mintVago(uint256 _numberToken,address _address) internal {
        for (uint256 i = 0; i < _numberToken; i++) {
            uint256 Id = _totalSupply;
            _totalSupply += 1;
            _safeMint(_address, Id);
            
        }
        
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Votes)
    {
        super._afterTokenTransfer(from, to, tokenId);
    }
}
