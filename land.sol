// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.2 <0.9.0;

contract LandMarkeplaceDapp {
    struct LandDetail {
        string province;
        string district;
        string village;
        uint blockNo;
        uint surveyNo;
        uint landValue; // in wei
        uint area;
        bool salesStatus;
    }

    mapping(uint => LandDetail) landDetails;
    uint registeredLandCount = 0;

    function registerNewLand(
        uint surveyNo,
        uint blockNo,
        string memory province,
        string memory district,
        string memory village,
        uint landValue,
        uint area
    ) public {
        landDetails[registeredLandCount] = LandDetail(
            surveyNo,
            blockNo,
            province,
            district,
            village,
            landValue,
            area,
            false
        );
    }
}
