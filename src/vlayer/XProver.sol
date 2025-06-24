// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Proof} from "vlayer-0.1.0/Proof.sol";
import {Prover} from "vlayer-0.1.0/Prover.sol";
import {Web, WebProof, WebProofLib, WebLib} from "vlayer-0.1.0/WebProof.sol";

contract XProver is Prover {
    using WebProofLib for WebProof;
    using WebLib for Web;

    string public constant DATA_URL = "https://api.twitter.com/2/users/me?user.fields=id,name,username,created_at,description,profile_image_url,public_metrics";

    function main(WebProof calldata webProof) public view returns (Proof memory, string memory, int256) {
        Web memory web = webProof.verify(DATA_URL);

        string memory username = web.jsonGetString("data.username");
        int256 followersCount = web.jsonGetInt("data.public_metrics.followers_count");

        return (proof(), username, followersCount);
    }
}