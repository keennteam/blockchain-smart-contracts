// ***
// improves the previous contract code by using events
// ***

// Version of the solidity compiler
pragma solidity ^0.4.22;

// ---- base contract Owned
contract owned {
  address owner;

  //constructor that sets the owner
  constructor() {
    owner = msg.sender;
  }

  //access control modifier
  modifier onlyOwner {
    require(msg.sender == owner);
    _
  }
}

// ---- next we define another contract "mortal" that inherits Owned
contract mortal is owned {
  //write a destructor function
  function destroy() public onlyOwner {
    selfdestruct(owner);
  }
}

// ---- the faucet contract
contract Faucet is mortal {

  // events!! "indexed" makes the value part of an indexed table (hash table)
  event Withdrawal(address indexed to, uint amount);
  event Deposit(address indexed from, uint amount);

  //give ether out to anyone who asks
  function withdraw(uint withdraw_amount) public {
    //limit withdrawal amount
    require(withdraw_amount <= 0.1 ether);
    //send the amt to the addr that requested it
    msg.sender.transfer(withdraw_amount);
    // EMIT the event here!
    emit Withdrawal(msg.sender, withdraw_amount);
  }

  //accept any ether from transactions
  function () public payable {
    emit Deposit(msg.sender, msg.value);
  }
}
