class Solution {
    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        // Create a dictionary to store the mapping from the original digits to the mapped digits
        var digitMapping: [Int: Int] = [:]
        for (index, mappedDigit) in mapping.enumerated() {
            digitMapping[index] = mappedDigit
        }
        
        // Create an array to store tuples of the original number and its mapped value
        var mappedNumbers: [(original: Int, mapped: Int)] = []
        for number in nums {
            // Convert the number to an array of its digits
            let digitsArray = Array(String(number)).map { Int(String($0))! }
            var mappedString: String = ""
            for digit in digitsArray {
                // Get the mapped value for each digit
                let mappedDigit = digitMapping[digit]!
                // Append the mapped digit to the mappedString
                mappedString += "\(mappedDigit)"
            }
            // Convert the mappedString back to an integer
            let mappedInteger = Int(mappedString)!
            // Append the original number and its mapped value to the mappedNumbers array
            mappedNumbers.append((original: number, mapped: mappedInteger))
        }
        
        // Sort the mappedNumbers array based on the mapped values and return the original numbers in sorted order
        return mappedNumbers.sorted { $0.mapped < $1.mapped }.map { $0.original }
    }
}
