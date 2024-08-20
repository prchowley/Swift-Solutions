/// This class represents the solution to LeetCode problem 1140, Stone Game II.
class Solution {
    /// This method calculates the maximum number of stones Alice can collect
    /// when both players play optimally.
    ///
    /// - Parameter piles: An array of integers representing the number of stones in each pile.
    /// - Returns: The maximum number of stones Alice can collect.
    func stoneGameII(_ piles: [Int]) -> Int {
        // Calculate the total number of piles.
        let totalPilesCount = piles.count
        
        // Create a dictionary to memoize results for subproblems.
        // Key: (current index, M), Value: the maximum stones that can be collected.
        var memoizationCache = [String: Int]()
        
        // Helper function that uses dynamic programming to calculate the maximum stones.
        //
        // - Parameters:
        //   - currentIndex: The current index in the piles array.
        //   - currentM: The current value of M, which determines the range of piles Alice can take.
        // - Returns: The maximum stones that can be collected starting from currentIndex with the given M.
        func dp(currentIndex: Int, currentM: Int) -> Int {
            // Base case: if all piles have been considered, no more stones can be taken.
            if currentIndex >= totalPilesCount {
                return 0
            }
            
            // Create a unique key for the memoization cache using the currentIndex and currentM.
            let cacheKey = "\(currentIndex)-\(currentM)"
            
            // If the result for this subproblem is already computed, return the cached result.
            if let cachedResult = memoizationCache[cacheKey] {
                return cachedResult
            }
            
            // Calculate the total number of remaining stones from the current index onwards.
            var remainingStones = 0
            for i in currentIndex..<totalPilesCount {
                remainingStones += piles[i]
            }
            
            // Initialize the maximum stones Alice can collect from this point onwards to zero.
            var maxStonesAliceCanCollect = 0
            
            // Variable to track the sum of stones taken by Alice in each possible move.
            var sumOfStonesTaken = 0
            
            // Try taking `x` piles where `x` can be from 1 to `2 * currentM`.
            for x in 1...min(2 * currentM, totalPilesCount - currentIndex) {
                // Add the stones from the current pile to the sum of stones Alice takes.
                sumOfStonesTaken += piles[currentIndex + x - 1]
                
                // Calculate the stones Bob would get if Alice takes `x` piles, using recursion.
                let stonesBobCanCollect = dp(currentIndex: currentIndex + x, currentM: max(currentM, x))
                
                // Calculate the maximum stones Alice can get by subtracting Bob's stones from the total remaining.
                maxStonesAliceCanCollect = max(maxStonesAliceCanCollect, remainingStones - stonesBobCanCollect)
            }
            
            // Cache the result for this subproblem.
            memoizationCache[cacheKey] = maxStonesAliceCanCollect
            
            // Return the maximum stones Alice can collect from this point onwards.
            return maxStonesAliceCanCollect
        }
        
        // Start the recursive dynamic programming from the first pile with M = 1.
        return dp(currentIndex: 0, currentM: 1)
    }
}