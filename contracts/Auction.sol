pragma solidity ^0.4.24;

import "./Permissions.sol";


/**
 * @title Auction
 * @dev 
 */
contract Auction is Ownable {

    mapping (address => uint) biddings;
    uint256 startTimestamp;
    uint256 endTimestamp;
    string lot;
    bool isActive;
    uint256 bidIncrement;
    uint256 highestBindingBid;

    event auctionStart();
    event newBid(address bidder, uint bid, uint newHighestBindingBid);
    event auctionCancelled();

    function Auction(string _lot, uint duration, uint bidIncrement) onlyAuctioneer {
        lot = _lot;
        startTimestamp = now;
        endTimestamp = duration * 3600;
        isActive = true;
    }

    modifier onlyAfterStart() {
        require(now > startTimestamp);
        _;
    }

    modifier onlyBeforeEnd() {
        require(now < endTimestamp);
        _;
    }

    modifier onlyIfActive() {
        require(isActive == true);
        _;
    }

    function placeBid()
        public
        payable
        onlyAfterStart
        onlyBeforeEnd
        onlyIfActive
        onlyNotOwner {

    }

}