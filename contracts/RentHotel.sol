// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract RentHotel{
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses currentStatus;
    event Occupy(address _occuoand, uint _value);
    address payable public owner;

    constructor(){
        owner = payable (msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently Occupied");
        _;
    }

    modifier costs (uint _amount){
        require(msg.value>= _amount, "Not enough Ether provided");
        _;
    }
    
    receive() external payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
} 