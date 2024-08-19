class Solution {
    func minSteps(_ target: Int) -> Int {
        // Base case: if the target is 1, no operations are needed
        guard target > 1 else { return 0 }
        
        // Array to store the minimum steps to reach each number from 1 to target
        var minStepsArray = Array(repeating: Int.max, count: target + 1)
        minStepsArray[1] = 0 // It takes 0 steps to reach 1 'A'

        // Iterate from 2 to target to fill the minStepsArray
        for current in 2...target {
            // Iterate to find all possible divisors of current
            for divisor in 1...Int(sqrt(Double(current))) {
                if current % divisor == 0 {
                    // For each divisor, update the steps required
                    let complement = current / divisor
                    minStepsArray[current] = min(minStepsArray[current], minStepsArray[divisor] + (current / divisor))
                    minStepsArray[current] = min(minStepsArray[current], minStepsArray[complement] + divisor)
                }
            }
        }
        
        return minStepsArray[target]
    }
}