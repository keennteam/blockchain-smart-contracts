// AUTHOR: 		Federico Giorgio De Faveri
// DATE: 			Jul 2nd 2017
// PURPOSE: 	This smart contract aims to introduce in a very simple way the notion of INHERITANCE in Solidity.
//						It will be accomplished by creating an "ownedByFederico" contract that will be inherited
//						by the previously wrote "school_simple_contract.sol" contract. This new contract will establish
//						ownership, and will be able to create a very important functionality in smart contracts: the ability
//						to kill a contract and return all the funds to the owner.
// LANGUAGE:  Solidity


// this contract will establish ownership of all the other contracts that will inherit it in the future, like the
// ProgrammingSchool contract ahead.
contract OwnedByFederico {

	// I establish a brand name
	string public brandName = "Fede Development";

	// declare a variable that will contain an Ethereum address
	address public owner;

	// create a constructor function, that will be called when the contract will be deployed.
  function OwnedByFederico() {

  	// this line will take the ETH address of the creator of the contract (the sender of the transaction)
  	// and assign it to the previously declared `owner` variable
  	owner = msg.sender;

  }

  // This function is very imporant. It makes us able to kill the contract if we find bugs or simply we the contract
  // is no longer useful.
  // REMEMBER: *nothing* is ever deleted from the blockchain. Killing a contract will overwrite its status and make other users
  // 			     unable to interact with it and send ether. But it will always possible to see all past changes and transactions.
  function killTheContract() {

  	// Any funds that the contract holds, will be sent to the address specified as the argument of the function
  	// which in this case is `owner`, which we previously declared
  	suicide(owner);
  }

}


// This is the SAME contract we wrote before (school_simple_contract.sol), but I changed the name and removed the comments
// By adding `is OwnedByFederico` we are inheriting all the variables and functions of the OwnedByFederico contract.
contract ProgrammingSchool is OwnedByFederico {

	struct Student {

		string studentName;
		uint studentAge;
		bool active;

	}

	uint256 public registrationFee;

	mapping(address => Student) public myStudents;

	function ProgrammingSchool (uint256 initialRegistrationFee) {

		registrationFee = initialRegistrationFee;

	}

	function register (string _myName, uint myAge) {


		if (msg.value == registrationFee) {

			myStudents[msg.sender] = Student({

				studentName: _myName,
				studentAge: _myAge,
				active: true

				});

		}
		else {

			throw;

		}

	}

	function setFee (uint256 _newRegistrationFee) {

		registrationFee = _newRegistrationFee;

	}

}
