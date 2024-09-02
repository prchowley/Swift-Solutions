import Foundation

/// A class containing methods to determine which student will need to replace the chalk.
class ChalkReplacementFinder {
    
    /// This method determines which student will need to replace the chalk
    /// when given an array of chalk usage by each student and a total number of chalk pieces.
    ///
    /// The method calculates the total chalk usage in one complete round,
    /// reduces the total chalk pieces `k` by using the modulo operation to
    /// minimize the number of full rounds needed, and then iterates through
    /// the students to find out who will need to replace the chalk.
    ///
    /// - Parameters:
    ///   - chalkUsageByStudent: An array of integers where each element represents
    ///                          the chalk usage of a student in one turn.
    ///   - totalChalkPieces: An integer representing the total number of chalk pieces available.
    /// - Returns: An integer representing the index of the student who will need to replace the chalk.
    static func findStudentToReplaceChalk(chalkUsageByStudent: [Int], totalChalkPieces: Int) -> Int {
        
        // Calculate the total chalk usage in one complete round of all students.
        // This is done by summing all elements in the chalkUsageByStudent array.
        let totalChalkUsageInOneRound: Int = chalkUsageByStudent.reduce(0, { $0 + $1 })
        
        // Reduce the totalChalkPieces by taking modulo of totalChalkUsageInOneRound.
        // This minimizes the number of full rounds to simulate.
        var remainingChalkPieces: Int = totalChalkPieces % totalChalkUsageInOneRound
        
        // Iterate through each student to find out who will need to replace the chalk.
        for (studentIndex, studentChalkUsage) in chalkUsageByStudent.enumerated() {
            
            // If the remaining chalk pieces are less than the chalk usage of the current student,
            // then this student will need to replace the chalk.
            if remainingChalkPieces < studentChalkUsage {
                return studentIndex
            }
            
            // Deduct the chalk usage of the current student from the remaining chalk pieces.
            remainingChalkPieces -= studentChalkUsage
        }
        
        // This line should never be reached because there will always be a student who runs out of chalk.
        return -1
    }
}

// Example usage:

// Test case 1
let chalkUsageExample1 = [5, 1, 5]
let totalChalkPiecesExample1 = 22
let result1 = ChalkReplacementFinder.findStudentToReplaceChalk(chalkUsageByStudent: chalkUsageExample1, totalChalkPieces: totalChalkPiecesExample1)
print(result1) // Output: 0

// Test case 2
let chalkUsageExample2 = [3, 4, 1, 2]
let totalChalkPiecesExample2 = 25
let result2 = ChalkReplacementFinder.findStudentToReplaceChalk(chalkUsageByStudent: chalkUsageExample2, totalChalkPieces: totalChalkPiecesExample2)
print(result2) // Output: 1