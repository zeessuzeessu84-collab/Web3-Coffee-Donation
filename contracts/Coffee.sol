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
    
   
    Memo[] memos;

    address payable private _owner; // Adding owner as private variable

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner); //Adding for event emission that when owner gets transferred



    constructor() {
        owner = payable(msg.sender);
    }

// @Added transferOwnership function for transfering to new owner which accepts address of the new owner as parameter 
     function transferOwnership(address payable newOwner) public {
    require(msg.sender == _owner, "Only owner can transfer");
    require(newOwner != address(0), "New owner cannot be zero address");
    
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
}  

function owner() public view returns (address) {
    return _owner;
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
