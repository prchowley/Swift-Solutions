class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
                // Step 1: Count the frequency of each number
        var frequencyDictionary: [Int: Int] = [:]
        for number in nums {
            // Increase the count of the current number in the frequency dictionary
            frequencyDictionary[number, default: 0] += 1
        }

        // Step 2: Sort the array based on the frequency first and then by value in descending order
        let sortedNumbers = nums.sorted { (firstNumber, secondNumber) -> Bool in
            // Compare the frequency of two numbers (firstNumber and secondNumber)
            if frequencyDictionary[firstNumber]! == frequencyDictionary[secondNumber]! {
                // If frequencies are equal, sort by the number in descending order
                return firstNumber > secondNumber
            } else {
                // Otherwise, sort by frequency in ascending order
                return frequencyDictionary[firstNumber]! < frequencyDictionary[secondNumber]!
            }
        }

        // Return the sorted array
        return sortedNumbers
    }
}