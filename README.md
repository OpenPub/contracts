# OpenPub contracts

These are the contracts that govern the OpenPub protocol.

### `publisher_VXXX.sol`
Writes a publication to the blockchain. Get the current publiication count using the `getCount()` method. Get a single publication using `getPublication(uint256 _id)`, where `_id` is the publication ID. The max `_id` is equal to `getCount() - 1`.

`getPublication()` returns a tuple like this:
```
(
    counter (uint256),
    creator (address),
    title (string),
    authors (string[]),
    content_list (string),
    content_sha265 (string),
    description (string),
    acknowledgements (string),
)
```

TODO
- Voter contract enabling users to vote on submission qualities
