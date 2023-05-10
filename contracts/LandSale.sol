// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "./Land.sol";

contract LandSale is LandRegistration {

    struct BidDetail {
        uint256 highestBid;
        address highestBidder;
        mapping(address => uint256) bids;
        address[] bidders;
    }
    mapping(uint256 => BidDetail) bidDetails;

    function bid(uint256 landID) public payable {
        require(bidDetails[landID].bids[msg.sender] + msg.value > bidDetails[landID].highestBid, "can't bid, make a higher Bid");
        bidDetails[landID].highestBidder = msg.sender;
        bidDetails[landID].bidders.push(msg.sender);
        bidDetails[landID].highestBid = bidDetails[landID].bids[msg.sender] + msg.value;
        bidDetails[landID].bids[msg.sender] += msg.value;
    }

    function acceptBid(uint256 landID) public {

    }

    fallback() external {
        revert();
    }
}