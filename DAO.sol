// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDAO {
    struct Proposal {
        string description;
        uint256 voteCount;
        bool executed;
        mapping(address => bool) voted;
    }

    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCount;
    address public owner;
    mapping(address => bool) public members;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    modifier onlyMember() {
        require(members[msg.sender], "Only members can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender;
        members[msg.sender] = true;
    }

    function addMember(address _member) external onlyOwner {
        members[_member] = true;
    }

    function createProposal(string memory _description) external onlyMember {
        proposalCount++;
        Proposal storage newProposal = proposals[proposalCount];
        newProposal.description = _description;
        newProposal.voteCount = 0;
        newProposal.executed = false;
    }

    function vote(uint256 _proposalId) external onlyMember {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.voted[msg.sender], "You have already voted.");
        proposal.voted[msg.sender] = true;
        proposal.voteCount++;
    }

    function executeProposal(uint256 _proposalId) external onlyOwner {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.voteCount > 0, "Proposal needs at least 1 vote.");
        require(!proposal.executed, "Proposal already executed.");
        proposal.executed = true;

        // Add logic to execute the proposal here.
    }
}
