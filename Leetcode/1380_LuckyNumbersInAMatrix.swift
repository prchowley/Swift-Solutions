class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        let numberOfRows = matrix.count // Get the number of rows in the matrix
        let numberOfColumns = matrix[0].count // Get the number of columns in the matrix
        
        // Step 1: Find the minimum in each row
        var minimumInRows = [Int](repeating: Int.max, count: numberOfRows) // Initialize an array to store the minimum values of each row
        for rowIndex in 0..<numberOfRows { // Loop through each row
            for columnIndex in 0..<numberOfColumns { // Loop through each column in the current row
                // Update the minimum value for the current row
                minimumInRows[rowIndex] = min(minimumInRows[rowIndex], matrix[rowIndex][columnIndex])
            }
        }
        
        // Step 2: Find the maximum in each column
        var maximumInColumns = [Int](repeating: Int.min, count: numberOfColumns) // Initialize an array to store the maximum values of each column
        for columnIndex in 0..<numberOfColumns { // Loop through each column
            for rowIndex in 0..<numberOfRows { // Loop through each row in the current column
                // Update the maximum value for the current column
                maximumInColumns[columnIndex] = max(maximumInColumns[columnIndex], matrix[rowIndex][columnIndex])
            }
        }
        
        // Step 3: Find the lucky numbers
        var luckyNumbers = [Int]() // Initialize an array to store the lucky numbers
        for rowIndex in 0..<numberOfRows { // Loop through each row
            for columnIndex in 0..<numberOfColumns { // Loop through each column in the current row
                // Check if the current element is both the minimum in its row and the maximum in its column
                if matrix[rowIndex][columnIndex] == minimumInRows[rowIndex] && matrix[rowIndex][columnIndex] == maximumInColumns[columnIndex] {
                    luckyNumbers.append(matrix[rowIndex][columnIndex]) // If true, add the element to the luckyNumbers array
                }
            }
        }

        return luckyNumbers // Return the list of lucky numbers
    }
}