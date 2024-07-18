class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0 // Variable to store the maximum length of substring without repeating characters
        var left = 0 // Left pointer for the sliding window
        var charIndexMap = [Character: Int]() // Dictionary to store the index of each character
        
        // Iterate through each character in the string using a sliding window approach
        for (right, char) in s.enumerated() {
            // If the character is already in the map and its index is >= left pointer,
            // update the left pointer to the next index of the repeating character
            if let index = charIndexMap[char], index >= left {
                left = index + 1
            }
            
            // Update the index of the current character in the map
            charIndexMap[char] = right
            
            // Calculate the current length of the substring without repeating characters
            let currentLength = right - left + 1
            
            // Update maxLength if the current length is greater
            maxLength = max(maxLength, currentLength)
        }
        
        return maxLength
    }
}
