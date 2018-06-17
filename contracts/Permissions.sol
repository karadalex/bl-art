pragma solidity ^0.4.24;

import "./Ownable.sol";

/**
 * @title Permissions
 * @dev 
 */
contract Permissions is Ownable {

    mapping (address => int) auctioneers;
    mapping (address => int) galleries;
    mapping (address => int) artExperts;
    mapping (address => int) luxuryExperts;

    // Auctioneers
    function addAuctioneer(address _address) external onlyOwner {
        auctioneers[_address] = 1;
    }

    modifier onlyAuctioneer() {
        require(auctioneers[msg.sender] == 1);
        require(msg.sender != owner);
        _;
    }

    // Galleries
    function addGallery(address _address) external onlyOwner {
        galleries[_address] = 1;
    }

    modifier onlyGallery() {
        require(galleries[msg.sender] == 1);
        require(msg.sender != owner);
        _;
    }

    // Art Experts
    function addArtExpert(address _address) external onlyOwner {
        artExperts[_address] = 1;
    }

    modifier onlyArtExpert() {
        require(artExperts[msg.sender] == 1);
        require(msg.sender != owner);
        _;
    }

    // Luxury Experts
    function addLuxuryExpert(address _address) external onlyOwner {
        luxuryExperts[_address] = 1;
    }

    modifier onlyLuxuryExpert() {
        require(luxuryExperts[msg.sender] == 1);
        require(msg.sender != owner);
        _;
    }

}