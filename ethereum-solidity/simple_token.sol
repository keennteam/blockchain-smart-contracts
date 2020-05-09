// AUTHOR:          Federico Giorgio De Faveri
// DATE:            Jul 5th 2017
// PURPOSE:         This is the minimum code needed to issue a custom token on the ethereum blockchain.
// LANGUAGE:        Solidity
// BOILERPLATE BY:  Ethereum foundation

contract MyToken {

    /* Name of the token */
    string public tokenName;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken(
        uint256 initialSupply,
        string _name
        ) {
        tokenName = _name;
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
    }
}
