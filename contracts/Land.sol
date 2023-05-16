// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LandRegistration is ERC721 {
    constructor() ERC721("Land", "LND") {}

    struct LandDetail {
        string province;
        string district;
        string village;
        uint blockNo;
        uint surveyNo;
        uint landValue; // in wei
        uint area;
        bool salesStatus;
        bytes documentHash;
    }

    mapping(uint => LandDetail) landDetails;

    uint public registeredLandCount = 0;

    bool salesStatus;

    function registerNewLand(
        uint surveyNo,
        uint blockNo,
        string memory province,
        string memory district,
        string memory village,
        uint landValue,
        uint area,
        bytes memory documentHash
    ) public {
        landDetails[registeredLandCount] = LandDetail(
            province,
            district,
            village,
            surveyNo,
            blockNo,
            landValue,
            area,
            false,
            documentHash
        );
        _mint(msg.sender, registeredLandCount);
        registeredLandCount += 1;
    }

    function getLandDetails(
        uint landID
    ) public view returns (LandDetail memory) {
        return landDetails[landID];
    }
}
