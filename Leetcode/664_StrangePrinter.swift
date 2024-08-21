class Solution {
    func strangePrinter(_ s: String) -> Int {
        // Get the length of the input string
        let totalCharacters: Int = s.count
        
        // Return 0 if the string is empty, as no turns are needed
        guard totalCharacters > 0 else { return 0 }

        // Convert the input string into an array of characters for easy indexing
        let charactersArray: [Character] = Array(s)
        
        // Initialize a 2D array 'dp' to store the minimum number of turns required to print each substring
        var minimumTurns = Array(
            repeating: Array(repeating: 0, count: totalCharacters), count: totalCharacters
        )
        
        // Iterate through each possible length of substring, starting from 1 to totalCharacters
        for currentLength in 1...totalCharacters {
            // Iterate through each starting index of the substring
            for startIndex in 0...(totalCharacters - currentLength) {
                // Calculate the ending index of the current substring
                let endIndex: Int = startIndex + currentLength - 1
                
                // Initialize the number of turns to the length of the substring (worst case)
                minimumTurns[startIndex][endIndex] = currentLength
                
                // Iterate through all possible splits of the substring
                for splitIndex in startIndex..<endIndex {
                    // Calculate the total turns by splitting the substring at 'splitIndex'
                    let totalTurns = minimumTurns[startIndex][splitIndex] + minimumTurns[splitIndex + 1][endIndex]
                    
                    // If the character at 'splitIndex' is the same as the character at 'endIndex',
                    // reduce the number of turns by 1 since they can be printed in the same turn
                    if charactersArray[splitIndex] == charactersArray[endIndex] {
                        minimumTurns[startIndex][endIndex] = min(
                            minimumTurns[startIndex][endIndex], totalTurns - 1
                        )
                    } else {
                        // Otherwise, consider the calculated turns as is
                        minimumTurns[startIndex][endIndex] = min(
                            minimumTurns[startIndex][endIndex], totalTurns
                        )
                    }
                }
            }
        }
        
        // Return the minimum number of turns needed to print the entire string
        return minimumTurns[0][totalCharacters - 1]
    }
}