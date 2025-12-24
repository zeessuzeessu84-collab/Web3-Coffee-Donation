// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Coffee {
    // Event to emit when a Memo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );
    
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    
    address payable owner;
    Memo[] memos;

    constructor() {
        owner = payable(msg.sender);
    }

    // Function to buy a coffee
    function buyCoffee(string memory _name, string memory _message) public payable {
        require(msg.value > 0, "Can't buy coffee with 0 eth");

        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    // Withdraw funds to owner
    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    // Get all memos
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
