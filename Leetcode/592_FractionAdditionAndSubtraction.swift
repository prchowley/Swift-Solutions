class Solution {

    // Function to find the greatest common divisor (GCD) of two integers
    func greatestCommonDivisor(of firstNumber: Int, and secondNumber: Int) -> Int {
        var firstAbsoluteNumber = abs(firstNumber) // Absolute value of the first number
        var secondAbsoluteNumber = abs(secondNumber) // Absolute value of the second number
        
        // Loop until the remainder is 0, which means we've found the GCD
        while secondAbsoluteNumber != 0 {
            let remainder = firstAbsoluteNumber % secondAbsoluteNumber // Calculate remainder
            firstAbsoluteNumber = secondAbsoluteNumber // Update first number to be the second number
            secondAbsoluteNumber = remainder // Update second number to be the remainder
        }
        
        return firstAbsoluteNumber // Return the greatest common divisor
    }

    func fractionAddition(_ expression: String) -> String {
        var finalNumerator = 0 // Initialize the numerator of the result
        var finalDenominator = 1 // Initialize the denominator of the result
        
        var index = 0 // Start index for parsing the expression
        let lengthOfExpression = expression.count // Total number of characters in the expression
        let expressionArray = Array(expression) // Convert the expression string to an array of characters
        
        // Loop through the entire expression
        while index < lengthOfExpression {
            var currentSign = 1 // Default sign is positive (+)
            
            // Check for a sign at the current position
            if expressionArray[index] == "-" || expressionArray[index] == "+" {
                currentSign = expressionArray[index] == "-" ? -1 : 1 // Update sign based on the character
                index += 1 // Move to the next character
            }
            
            var currentNumerator = 0 // Initialize the numerator for the current fraction
            // Parse the numerator by looping until a '/' is found
            while index < lengthOfExpression && expressionArray[index].isNumber {
                currentNumerator = currentNumerator * 10 + Int(String(expressionArray[index]))! // Build the numerator
                index += 1 // Move to the next character
            }
            
            index += 1 // Skip the '/' character
            
            var currentDenominator = 0 // Initialize the denominator for the current fraction
            // Parse the denominator by looping until the end of the number
            while index < lengthOfExpression && expressionArray[index].isNumber {
                currentDenominator = currentDenominator * 10 + Int(String(expressionArray[index]))! // Build the denominator
                index += 1 // Move to the next character
            }
            
            // Update the result by adding the new fraction to it
            finalNumerator = finalNumerator * currentDenominator + currentSign * currentNumerator * finalDenominator
            finalDenominator *= currentDenominator // Update the denominator
            
            // Simplify the result by dividing both the numerator and denominator by their GCD
            let commonDivisor = greatestCommonDivisor(of: finalNumerator, and: finalDenominator)
            finalNumerator /= commonDivisor // Divide the numerator by the GCD
            finalDenominator /= commonDivisor // Divide the denominator by the GCD
        }
        
        // Ensure the denominator is positive
        if finalDenominator < 0 {
            finalNumerator = -finalNumerator // Negate the numerator if the denominator is negative
            finalDenominator = -finalDenominator // Make the denominator positive
        }
        
        return "\(finalNumerator)/\(finalDenominator)" // Return the final simplified fraction as a string
    }
}