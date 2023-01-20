// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Publisher {

    address private owner;
    uint256 private counter;

    constructor() {
        owner = msg.sender;
        counter = 0;
     }

    struct Publication {
        uint256 _id;
        address creator;
        string title;
        string[] authors;
        string content_link;
        string content_sha256;
        string description;
        string acknowledgement;
    }

    event newPublicationEvent (
        uint256 _id, 
        address creator,
        string title,
        string[] authors,
        string content_link,
        string content_sha256,
        string description,
        string acknowledgement
    );

    mapping(uint256 => Publication) publications;

    // create a single publication
    function publish(
        string memory title,
        string[] memory authors,
        string memory content_link,
        string memory content_sha256,
        string memory description,
        string memory acknowledgement
    ) public payable {
            Publication storage p = publications[counter];
            p._id = counter;
            p.creator = msg.sender;
            p.title = title;
            p.authors = authors;
            p.content_link = content_link;
            p.content_sha256 = content_sha256;
            p.description = description;
            p.acknowledgement = acknowledgement;
            emit newPublicationEvent(
                counter, 
                msg.sender, 
                title,
                authors,
                content_link,
                content_sha256,
                description,
                acknowledgement
            );
            counter ++;
    }

    // get the current publication count
    function getCount() public view returns (uint256) {
        return (counter);
    }

    // get a single publication by its ID
    function getPublication(uint256 _id) public view returns (
        uint256,
        address,
        string memory,
        string[] memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        require(_id < counter, "Publication ID does not exist");
        Publication storage p = publications[_id];
        return (
            p._id,
            p.creator,
            p.title,
            p.authors,
            p.content_link,
            p.content_sha256,
            p.description,
            p.acknowledgement
        );
    }
}