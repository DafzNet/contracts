// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Procurement {
    struct Supplier {
        string name;
        string registrationNumber;
        bool isApproved;
    }

    struct Bid {
        address supplier;
        uint256 amount;
        string details;
        bool isSubmitted;
    }

    mapping(address => Supplier) public suppliers;
    mapping(uint256 => Bid[]) public bids; // RFP ID to bids mapping
    mapping(uint256 => address) public winningBid; // RFP ID to winning supplier

    function onboardSupplier(string memory _name, string memory _registrationNumber) public {
        suppliers[msg.sender] = Supplier({
            name: _name,
            registrationNumber: _registrationNumber,
            isApproved: true
        });
    }

    function submitBid(uint256 _rfpId, uint256 _amount, string memory _details) public {
        bids[_rfpId].push(Bid({
            supplier: msg.sender,
            amount: _amount,
            details: _details,
            isSubmitted: true
        }));
    }

    function evaluateBids(uint256 _rfpId) public {
        uint256 lowestAmount = type(uint256).max;
        address winningSupplier;

        for (uint256 i = 0; i < bids[_rfpId].length; i++) {
            if (bids[_rfpId][i].amount < lowestAmount) {
                lowestAmount = bids[_rfpId][i].amount;
                winningSupplier = bids[_rfpId][i].supplier;
            }
        }

        winningBid[_rfpId] = winningSupplier;
    }

    function getWinningBid(uint256 _rfpId) public view returns (address) {
        return winningBid[_rfpId];
    }
}
