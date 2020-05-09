// AUTHOR: 		Federico Giorgio De Faveri
// DATE: 			Jul 4th 2017
// PURPOSE: 	This smart contract aims to introduce in a very simple way the notion of PROXY CONTRACTS in Solidity.
//						It will be accomplished by creating an `employee` contract, which can be modified by an `employer` contract
//
// LANGUAGE:  Solidity

contract Employee {

	//variables
	string public employeeName;
	uint public employeeAge;
	string public employeeRole;

	//constructor
	function Employee(string _name , uint _age) {
		employeeName = _name;
		employeeAge = _age;
	}

	function setEmployeeRole(string _role) {
		employeeRole = _role;
	}

}

//this contract will interact with the employee contract directly
contract Employer {

	address public employeeAddress;

	//constructor will force the creator to deploy the Employer contract with an address for the employee
	function Employer(address _addressOfTheEmployee) {

		employeeAddress = _addressOfTheEmployee;

	}

  //this function will interact with the previous contract to call its function
	function assignRoleToEmployee(string _role) {

    //we need the address of the employee contract in order to be able to instantiate it.
		Employee myEmployee = Employee(employeeAddress);
		//here we are calling the function of employee and passing in the arg
		myEmployee.setEmployeeRole(_role);

	}
}
