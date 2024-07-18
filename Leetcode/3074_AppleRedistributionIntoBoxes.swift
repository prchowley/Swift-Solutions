// Greedy algorithm
class Solution {
    func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
        var totalApples = apple.reduce(0, +)
        let sortedBoxes = capacity.sorted(by: >)
        var count = 0
        for box in sortedBoxes {
            totalApples -= box
            count += 1
            if totalApples <= 0 {
                return count
            }
        }
        return count
    }
}


// Binary Search
class Solution {
    func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
        let totalApples = apple.reduce(0, +)
        let sortedBoxes = capacity.sorted(by: >)
        
        // Binary search initialization
        var low = 1
        var high = capacity.count
        var result = high
        
        // Helper function to check if given number of boxes is sufficient
        func canStoreBoxes(_ boxes: Int) -> Bool {
            var applesLeft = totalApples
            for i in 0..<min(boxes, capacity.count) {
                applesLeft -= sortedBoxes[i]
                if applesLeft <= 0 {
                    return true
                }
            }
            return false
        }
        
        // Binary search to find the minimum number of boxes
        while low <= high {
            let mid = (low + high) / 2
            if canStoreBoxes(mid) {
                result = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return result
    }
}