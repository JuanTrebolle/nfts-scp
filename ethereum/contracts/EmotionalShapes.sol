// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // We need the ERC721 contract, because it is the 'base' of this smart contract.
import "@openzeppelin/contracts/utils/Counters.sol";

contract EmotionalShapes is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter; // to generate incremental ids for the NFTs

    constructor() ERC721("EmotionalShapes", "ESS") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://135a-190-2-131-207.eu.ngrok.io/api/erc721/";
    }

    /*
     * min function increments _tokenIdCounter by 1, 
     then calls _safeMint from OpenZeppelin to publish the token
     */
    function mint(address to) public returns (uint256) {
        require(_tokenIdCounter.current() < 3);
        _tokenIdCounter.increment();
        _safeMint(to, _tokenIdCounter.current());

        return _tokenIdCounter.current();
    }
}
