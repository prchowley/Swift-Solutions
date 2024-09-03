import Foundation

class Solution {
    
    /// Transforms a given string into an integer by converting characters to their corresponding positions in the alphabet and summing the digits multiple times.
    ///
    /// This method performs the following steps:
    /// 1. Converts each character in the string to its corresponding position in the alphabet.
    /// 2. Concatenates these positions to form a numeric string.
    /// 3. Repeatedly sums the digits of the numeric string `k` times.
    ///
    /// - Parameters:
    ///   - s: The input string consisting of lowercase English letters.
    ///   - k: The number of times to transform the numeric string by summing its digits.
    /// - Returns: The resulting integer after performing the transformations.
    func getLucky(_ s: String, _ k: Int) -> Int {
        // Step 1: Convert each character to its corresponding position in the alphabet
        var numericString = s.reduce("") { (result, char) in
            if let asciiValue = char.asciiValue {
                let position = Int(asciiValue) - 96 // 'a' is 97 in ASCII
                return result + "\(position)"
            }
            return result
        }
        
        // Step 2: Transform the numeric string k times
        for _ in 0..<k {
            let digitSum = numericString.reduce(0) { $0 + Int(String($1))! }
            numericString = "\(digitSum)"
        }
        
        return Int(numericString) ?? -1
    }
}

// Example test cases
let solution = Solution()

// Dry run for example case "leetcode" with k = 2
let exampleString = "leetcode"
let exampleTransformations = 2
let result = solution.getLucky(exampleString, exampleTransformations)
print(result) // Expected output: 6

/*
 Dry run for "leetcode", k = 2:
 - Convert: "leetcode" ➝ "12 5 5 20 3 15 4 5" ➝ "12552031545"
 - Transform #1: 12552031545 ➝ 1 + 2 + 5 + 5 + 2 + 0 + 3 + 1 + 5 + 4 + 5 ➝ 33
 - Transform #2: 33 ➝ 3 + 3 ➝ 6
 Thus the resulting integer is 6.
*/