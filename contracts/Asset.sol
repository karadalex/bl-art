pragma solidity ^0.4.24;

import "./Permissions.sol";

contract Asset is Ownable {

    uint256 assetId;

    // Store data outside of Blockchain in IPFS or BigchainDB
    // but store in Blockchain a pointer/link to that data
    mapping (string => string) assetDetailsPointers;
    bool isAuthentic;
    address validator;

    event assetCheckedForAuthenticity(uint256 assetId, bool isAuthentic, address validator);

    function Asset(uint256 _assetId) {
        assetId = _assetId;
    }

    function addDetailsPointer(string pointer, string pointerType) public {
        assetDetailsPointers[pointer] = pointerType;
    }

    function isArtAssetAuthentic(bool decision) public onlyArtExpert {
        isAuthentic = decision;
        validator = msg.sender;
        assetCheckedForAuthenticity(assetId, isAuthentic, msg.sender);
    }
}