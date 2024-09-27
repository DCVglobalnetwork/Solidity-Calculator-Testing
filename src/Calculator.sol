// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title Calculator
 * @dev A simple calculator contract that stores the result of the last operation
 *      and provides basic arithmetic operations: addition, subtraction,
 *      multiplication, and division.
 */
contract Calculator {
    // State variable to store the result of the last calculation
    uint256 private result;

    // Events to log each arithmetic operation
    event CalculationPerformed(string operation, uint256 a, uint256 b, uint256 result);

    // Constructor: runs only once when the contract is deployed
    constructor(uint256 _initialResult) {
        result = _initialResult; // Initialize the result state variable
        emit CalculationPerformed("Initialized", 0, 0, result);
    }

    /**
     * @dev Adds two numbers and stores the result.
     * @param a First number to add (uint256).
     * @param b Second number to add (uint256).
     * @return The result of the addition (a + b).
     */
    function add(uint256 a, uint256 b) public returns (uint256) {
        result = a + b;
        emit CalculationPerformed("Addition", a, b, result);
        return result;
    }

    /**
     * @dev Subtracts the second number from the first and stores the result.
     * @param a The number to subtract from (uint256).
     * @param b The number to subtract (uint256).
     * @return The result of the subtraction (a - b).
     */
    function subtract(uint256 a, uint256 b) public returns (uint256) {
        result = a - b;
        emit CalculationPerformed("Subtraction", a, b, result);
        return result;
    }

    /**
     * @dev Multiplies two numbers and stores the result.
     * @param a First number to multiply (uint256).
     * @param b Second number to multiply (uint256).
     * @return The result of the multiplication (a * b).
     */
    function multiply(uint256 a, uint256 b) public returns (uint256) {
        result = a * b;
        emit CalculationPerformed("Multiplication", a, b, result);
        return result;
    }

    /**
     * @dev Divides the first number by the second and stores the result.
     * @param a The number to divide (uint256).
     * @param b The divisor (uint256), must not be zero.
     * @return The result of the division (a / b).
     */
    function divide(uint256 a, uint256 b) public returns (uint256) {
        require(b != 0, "Division by zero is not allowed");
        result = a / b;
        emit CalculationPerformed("Division", a, b, result);
        return result;
    }

    /**
     * @dev Returns the result of the last calculation.
     * @return The result of the last arithmetic operation.
     */
    function getResult() public view returns (uint256) {
        return result;
    }
}
