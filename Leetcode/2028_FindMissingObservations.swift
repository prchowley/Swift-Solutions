class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        // Step 1: Calculate the total number of rolls (m + n)
        let m = rolls.count
        let totalRolls = m + n
        
        // Step 2: Calculate the total sum we need for the mean
        let totalSum = mean * totalRolls
        
        // Step 3: Calculate the sum of the given rolls
        let sumOfGivenRolls = rolls.reduce(0, +)
        
        // Step 4: Calculate the required sum for the missing rolls
        let sumOfMissingRolls = totalSum - sumOfGivenRolls
        
        // Step 5: Check if it's possible to distribute the sum among n rolls (each must be between 1 and 6)
        if sumOfMissingRolls < n || sumOfMissingRolls > n * 6 {
            return [] // Impossible to distribute
        }
        
        // Step 6: Distribute the sum among n rolls
        var result = Array(repeating: 1, count: n) // Start by giving each roll the minimum value (1)
        var remainingSum = sumOfMissingRolls - n // Since each roll is initialized to 1
        
        for i in 0..<n {
            let add = min(remainingSum, 5) // We can add at most 5 to each roll to make it between 1 and 6
            result[i] += add
            remainingSum -= add
        }
        
        return result
    }
}