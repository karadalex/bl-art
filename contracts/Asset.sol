pragma solidity ^0.4.24;

contract AssetContract {

    struct Asset {
        uint256 assetId;
        address assetOwner;
        string assetDetailsPointer;
    }

    Asset[] assets;
}