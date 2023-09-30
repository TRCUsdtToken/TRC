// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceOracle {
    // Address of oracle set in the contract constructor
    address public oracleAddress;

    // Price data
    string public price;
    string public rank;
    string public marketCap;
    string public vol24H;
    string public perChange1H;
    string public perChange1D;
    string public perChange7D;

    // Function called on creation of contract, sets oracle address
    constructor(address _oracleAddress) {
        oracleAddress = _oracleAddress;
    }

    // Event emitted when price is updated from oracle
    event PriceUpdate(
        string price,
        string rank,
        string marketCap,
        string vol24H,
        string perChange1H,
        string perChange1D,
        string perChange7D
    );

    // Event emitted when a price update is initiated
    event InitUpdate();

    // Function called to return price data
    function getPriceData() public view returns (
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        return (
            price,
            rank,
            marketCap,
            vol24H,
            perChange1H,
            perChange1D,
            perChange7D
        );
    }

    // Function called to initiate price update
    function initUpdate() public {
        emit InitUpdate();
    }

    // Function called by oracle to update price data within contract
    function updatePrice(
        string memory _price,
        string memory _rank,
        string memory _marketCap,
        string memory _vol24H,
        string memory _perChange1H,
        string memory _perChange1D,
        string memory _perChange7D
    )
        public
    {
        require(msg.sender == oracleAddress, "Only the oracle can update prices");
        price = _price;
        rank = _rank;
        marketCap = _marketCap;
        vol24H = _vol24H;
        perChange1H = _perChange1H;
        perChange1D = _perChange1D;
        perChange7D = _perChange7D;

        emit PriceUpdate(
            price,
            rank,
            marketCap,
            vol24H,
            perChange1H,
            perChange1D,
            perChange7D
        );
    }
}
