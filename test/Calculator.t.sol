// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
// Import Foundry's Test library
import {Calculator} from "../src/Calculator.sol"; // Import the Calculator contract

/**
 * @title CalculatorTest
 * @dev A test contract for the Calculator contract, using Foundry.
 */
contract CalculatorTest is Test {
    // Instance of the Calculator contract
    Calculator calculator;

    // Declare the event here, same as in the Calculator contract
    event CalculationPerformed(string operation, uint256 a, uint256 b, uint256 result);

    /**
     * @dev Setup function, run before each test. Initializes the calculator
     *      with an initial result of 100 by calling the constructor.
     */
    function setUp() public {
        calculator = new Calculator(100); // Set initial result to 100
    }

    /**
     * @dev Test for the Addition event. Sets up expectations for the event,
     *      emits the expected event, and performs the addition operation to
     *      check if the event is emitted correctly.
     */
    function testAdditionEvent() public {
        // Set expectations for the event: check all fields (operation, a, b, result)
        vm.expectEmit(true, true, true, true);

        // Define the expected event: operation = "Addition", a = 10, b = 20, result = 30
        emit CalculationPerformed("Addition", 10, 20, 30);

        // Perform the addition operation, which should emit the expected event
        calculator.add(10, 20);
    }

    /**
     * @dev Test for the Subtraction event. Similar to the addition test, but
     *      checks the subtraction operation.
     */
    function testSubtractionEvent() public {
        // Set expectations for the event: check all fields (operation, a, b, result)
        vm.expectEmit(true, true, true, true);

        // Define the expected event: operation = "Subtraction", a = 30, b = 10, result = 20
        emit CalculationPerformed("Subtraction", 30, 10, 20);

        // Perform the subtraction operation, which should emit the expected event
        calculator.subtract(30, 10);
    }

    /**
     * @dev Test for the Multiplication event. Checks the event emitted by the
     *      multiplication operation.
     */
    function testMultiplicationEvent() public {
        // Set expectations for the event: check all fields (operation, a, b, result)
        vm.expectEmit(true, true, true, true);

        // Define the expected event: operation = "Multiplication", a = 5, b = 6, result = 30
        emit CalculationPerformed("Multiplication", 5, 6, 30);

        // Perform the multiplication operation, which should emit the expected event
        calculator.multiply(5, 6);
    }

    /**
     * @dev Test for the Division event. Checks the event emitted by the
     *      division operation.
     */
    function testDivisionEvent() public {
        // Set expectations for the event: check all fields (operation, a, b, result)
        vm.expectEmit(true, true, true, true);

        // Define the expected event: operation = "Division", a = 50, b = 2, result = 25
        emit CalculationPerformed("Division", 50, 2, 25);

        // Perform the division operation, which should emit the expected event
        calculator.divide(50, 2);
    }

    /**
     * @dev Test for the event emitted by the contract's constructor.
     *      Checks if the constructor emits the "Initialized" event correctly
     *      when the contract is deployed with an initial result of 100.
     */
    function testConstructorEvent() public {
        // Set expectations for the event emitted during contract deployment
        vm.expectEmit(true, true, true, true);

        // Define the expected event: operation = "Initialized", a = 0, b = 0, result = 100
        emit CalculationPerformed("Initialized", 0, 0, 100);

        // Deploy the contract (constructor will automatically run)
        calculator = new Calculator(100);
    }

    /**
     * @dev Test for adding large numbers to ensure no overflow occurs.
     *      This should add type(uint256).max - 1 + 1 and expect the result to be type(uint256).max.
     */
    function testAdditionWithLargeNumbers() public {
        uint256 largeA = type(uint256).max - 1; // Set it to one less than the maximum
        uint256 largeB = 1; // This will not cause overflow
        uint256 expected = largeA + largeB; // Expected result is type(uint256).max

        // Set expectations for the event
        vm.expectEmit(true, true, true, true);

        // Define the expected event
        emit CalculationPerformed("Addition", largeA, largeB, expected);

        // Perform the addition operation
        uint256 result = calculator.add(largeA, largeB);

        // Assert the result is as expected
        assertEq(result, expected);
    }

    /**
     * @dev Additional test to ensure no overflow occurs when adding zero.
     */
    function testAdditionWithZero() public {
        uint256 a = 0;
        uint256 b = 0;
        uint256 expected = a + b; // Expected result is 0

        // Set expectations for the event
        vm.expectEmit(true, true, true, true);

        // Define the expected event
        emit CalculationPerformed("Addition", a, b, expected);

        // Perform the addition operation
        uint256 result = calculator.add(a, b);

        // Assert the result is as expected
        assertEq(result, expected);
    }

    /**
     * @dev Test for addition overflow by exceeding the maximum value.
     *      This should revert due to overflow.
     */
    function testAdditionOverflow() public {
        uint256 largeA = type(uint256).max;
        uint256 largeB = 1; // This will cause an overflow

        // Expect the transaction to revert due to overflow
        vm.expectRevert();

        // Perform the addition operation, which should revert
        calculator.add(largeA, largeB);
    }

    function testSubtractionUnderflow() public {
        uint256 a = 10;
        uint256 b = 20;

        // Expect the transaction to revert due to underflow
        vm.expectRevert();

        // Perform the subtraction operation, which should revert
        calculator.subtract(a, b);
    }

    function testMultiplicationWithZero() public {
        uint256 a = 0;
        uint256 b = 100;
        uint256 expected = 0;

        // Set expectations for the event
        vm.expectEmit(true, true, true, true);

        // Define the expected event
        emit CalculationPerformed("Multiplication", a, b, expected);

        // Perform the multiplication operation
        uint256 result = calculator.multiply(a, b);

        // Assert the result is as expected
        assertEq(result, expected);
    }

    function testDivisionResultingInZero() public {
        uint256 a = 0;
        uint256 b = 10;
        uint256 expected = 0;

        // Set expectations for the event
        vm.expectEmit(true, true, true, true);

        // Define the expected event
        emit CalculationPerformed("Division", a, b, expected);

        // Perform the division operation
        uint256 result = calculator.divide(a, b);

        // Assert the result is as expected
        assertEq(result, expected);
    }

    function testDivisionByZero() public {
        // Expect the contract to revert when dividing by zero
        vm.expectRevert("Division by zero is not allowed");
        calculator.divide(100, 0);
    }

    function testSubtractionWithZero() public {
        // Test case: Subtracting zero from a number should return the same number
        uint256 result = calculator.subtract(10, 0);
        assertEq(result, 10);
    }

    function testSubtractionResultingInZero() public {
        // Test case: Subtracting a number from itself should result in zero
        uint256 result = calculator.subtract(10, 10);
        assertEq(result, 0);
    }

    function testMultiplicationZero() public {
        // Test case: Multiplying any number by zero should return zero
        uint256 result = calculator.multiply(100, 0);
        assertEq(result, 0);
    }

    function testDivisionByOne() public {
        // Test case: Dividing a number by one should return the same number
        uint256 result = calculator.divide(100, 1);
        assertEq(result, 100);
    }

    function testConstructorWithDifferentInitialValues() public {
        // Test case: Testing the constructor by initializing with a different initial value
        calculator = new Calculator(50); // Initialize the calculator with 50
        uint256 result = calculator.getResult();
        assertEq(result, 50); // The result should be the initial value set in the constructor
    }
}
