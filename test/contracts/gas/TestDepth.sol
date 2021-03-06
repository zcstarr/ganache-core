pragma solidity ^0.5.0;

contract TestDepth {
    uint256 public x = 1;

    function depth(uint256 y) public {
        // bool result;
        if (y > 0) {
            (bool result, bytes memory whatever) = address(this).delegatecall(abi.encodeWithSignature("depth(uint256)", --y));
            require(result);
        }
        else {
             // Save the remaining gas in storage so that we can access it later
             x = gasleft();
        }
    }
}
