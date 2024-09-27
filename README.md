# Solidity Calculator Testing

This project implements a simple calculator contract using Solidity, featuring basic arithmetic operations such as addition, subtraction, multiplication, and division. The primary focus of this project is to demonstrate a comprehensive testing framework using Foundry, with the goal of achieving 100% test coverage.

## Features
1. Basic arithmetic operations (addition, subtraction, multiplication, division)

2. State persistence of the last calculated result

3. Event emission on each arithmetic operation for logging purposes

4. Fully tested contract with 100% branch coverage and high overall coverage

5. Rigorous test cases to ensure correct functionality under various scenarios, including edge cases

## Smart Contract Overview

#### The contract provides the following operations:

#### Addition: 

Adds two numbers and updates the result.

#### Subtraction: 

Subtracts the second number from the first.

#### Multiplication: 

Multiplies two numbers.

#### Division: 

Divides the first number by the second, with a check for division by zero.

Each operation emits a CalculationPerformed event, which includes the operation name, operands, and result.

## Testing and Coverage
The project emphasizes testing to ensure the contract operates correctly under a wide range of conditions. We achieve 100% branch coverage and strive for high coverage in statements, functions, and lines.

## Key Testing Highlights:
#### Unit Testing: 

Comprehensive unit tests cover all operations in the contract, including edge cases like division by zero, large numbers, and zero values in operations.

#### Edge Case Testing: 

Special attention is given to handling potential overflow scenarios and boundary values. For example, testing uint256 maximum values to avoid overflow errors.

#### Constructor Testing: 

The constructor is tested with different initial values to ensure correct contract initialization.

#### Event Testing: 

Events are thoroughly tested to ensure they are emitted correctly, with the expected parameters.

## Test Coverage:

Branches: 100%

Statements: 93%

Functions: 83%

Lines: 93%

## Sample Test Cases:
#### Addition of Large Numbers: 

Handles addition near the maximum value for uint256.

#### Subtraction Resulting in Zero: 

Ensures correct behavior when subtracting equal values.

#### Multiplication with Zero: 

Validates that multiplication by zero yields zero.

#### Constructor Testing: 

Ensures correct initialization with different initial values.

## Running Tests
To run the tests and generate a coverage report:

```sh
forge test
forge coverage
```
## Achieving 100% Coverage
We focused on achieving 100% branch coverage, as this is critical in Solidity development to ensure that all logical paths through the contract are tested.

## The final coverage breakdown is:

Branches: 100%

Statements: 100%

Functions: 100%

Lines: 100%

We encourage others to further expand the test suite and add new test cases to reach even higher overall coverage.

![image](https://github.com/user-attachments/assets/ea8e67ea-9c3c-44c2-a9d0-d1544ccf82e2)


## Installation

```sh
git clone https://github.com/DCVglobalnetwork/Solidity-Calculator-Testing.git
cd Solidity-Calculator-Testing
forge install
```
## License
This project is licensed under the MIT License.





