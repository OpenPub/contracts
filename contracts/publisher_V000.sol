// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
TODO
- ADD PUB COUNTS BY CREATOR
- Add field for hashing

other fields
- links?
- contact info?
- messaging to eth address?

other contracts
- voting on quality

*/

contract Publisher {

    address private owner;
    uint256 private counter;

    constructor() {
        owner = msg.sender;
        counter = 0;
     }

    struct Publication {
        uint256 id;
        address creator;
        string title;
        string authors;
        string description;
    }

    event newPublicationEvent (
        uint256 id, 
        address creator,
        string title,
        string authors,
        string description
    );

    mapping(uint256 => Publication) publications;

    // create a single publication
    function publish(
        string memory title,
        string memory authors,
        string memory description
    ) public payable {
            Publication storage newPublication = publications[counter];
            newPublication.id = counter;
            newPublication.creator = msg.sender;
            newPublication.title = title;
            newPublication.authors = authors;
            newPublication.description = description;

            emit newPublicationEvent(
                counter, 
                msg.sender, 
                title,
                authors,
                description
            );

            counter ++;
    }

    // get the current count
    function getCount() public view returns (uint256) {
        return (counter);
    }

    // get a single publication byy its ID
    function getPublication(uint256 id) public view returns (
        uint256,
        address,
        string memory,
        string memory,
        string memory
    ) {
        require(id < counter, "Publication ID does not exist");
        Publication storage p = publications[id];
        return (p.id, p.creator, p.title, p.authors, p.description);
    }
}