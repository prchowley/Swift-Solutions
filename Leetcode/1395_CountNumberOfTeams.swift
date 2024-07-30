class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        
        // Initialize the count of valid teams to 0
        var numberOfValidTeams = 0
        
        // Get the number of soldiers
        let numberOfSoldiers = rating.count
        
        // Iterate through each soldier as the middle soldier of the team
        for middleIndex in 1..<(numberOfSoldiers - 1) {
            // Variables to count smaller and larger ratings on the left side of the middle soldier
            var smallerOnLeft = 0
            var largerOnLeft = 0
            
            // Variables to count smaller and larger ratings on the right side of the middle soldier
            var smallerOnRight = 0
            var largerOnRight = 0
            
            // Iterate through soldiers on the left of the middle soldier
            for leftIndex in 0..<middleIndex {
                if rating[leftIndex] < rating[middleIndex] {
                    smallerOnLeft += 1
                } else if rating[leftIndex] > rating[middleIndex] {
                    largerOnLeft += 1
                }
            }
            
            // Iterate through soldiers on the right of the middle soldier
            for rightIndex in (middleIndex + 1)..<numberOfSoldiers {
                if rating[rightIndex] < rating[middleIndex] {
                    smallerOnRight += 1
                } else if rating[rightIndex] > rating[middleIndex] {
                    largerOnRight += 1
                }
            }
            
            // Calculate the number of valid teams using the middle soldier as the middle team member
            // Add the number of ascending teams (smallerOnLeft * largerOnRight)
            // Add the number of descending teams (largerOnLeft * smallerOnRight)
            numberOfValidTeams += smallerOnLeft * largerOnRight + largerOnLeft * smallerOnRight
        }
        
        // Return the total number of valid teams
        return numberOfValidTeams
    }
}