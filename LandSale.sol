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

    }

    function acceptBid(uint256 landID) public {

    }

    fallback() external {
        revert();
    }
}