// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract VotingSystem {
    // Structure pour représenter un candidat
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
 // Mapping pour stocker les candidats avec l'identifiant du candidat comme clé
    mapping(uint => Candidate) public candidates;
    uint[] public candidateIds;
    mapping(address => bool) public voters;
    address public owner;
// Constructeur du contrat pour initialiser le propriétaire
    constructor() {
        owner = msg.sender;
    }
// ajout de candidat
    function addCandidate(uint _id, string memory _name) public {
        require(msg.sender == owner, "seul le proprietaire peut ajouter un candidat ");
        require(candidates[_id].id == 0, "cet identifiant existe");
        candidates[_id] = Candidate(_id, _name, 0);
        candidateIds.push(_id);
    }
//fonction vote qui est possible une seul fois par candidat
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "Vous avez deja vote ");
        require(candidates[_candidateId].id != 0, "le candidat n'exister pas");
        candidates[_candidateId].voteCount++;
        voters[msg.sender] = true;
    }
//recuperer tous les candidats
    function getAllCandidates() public view returns (Candidate[] memory) {
        Candidate[] memory allCandidates = new Candidate[](candidateIds.length);
        for (uint i = 0; i < candidateIds.length; i++) {
            uint candidateId = candidateIds[i];
            allCandidates[i] = candidates[candidateId];
        }
        return allCandidates;
    }
}
