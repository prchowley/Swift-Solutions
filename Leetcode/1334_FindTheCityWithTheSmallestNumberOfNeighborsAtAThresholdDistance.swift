class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        // Initialize the distance matrix with maximum possible values divided by 2 to avoid overflow
        var distanceMatrix = Array(repeating: Array(repeating: Int.max / 2, count: n), count: n)
        
        // Set the distance from each city to itself as 0
        for city in 0..<n {
            distanceMatrix[city][city] = 0
        }
        
        // Populate the distance matrix with the given edges
        for edge in edges {
            // Extract the start city, end city, and the weight of the edge
            let fromCity = edge[0]
            let toCity = edge[1]
            let edgeWeight = edge[2]
            // Set the distance for the bidirectional edge
            distanceMatrix[fromCity][toCity] = edgeWeight
            distanceMatrix[toCity][fromCity] = edgeWeight
        }
        
        // Apply the Floyd-Warshall algorithm to find the shortest paths between all pairs of cities
        for intermediateCity in 0..<n {
            for startCity in 0..<n {
                for endCity in 0..<n {
                    // Update the distance matrix if a shorter path is found
                    if distanceMatrix[startCity][endCity] > distanceMatrix[startCity][intermediateCity] + distanceMatrix[intermediateCity][endCity] {
                        distanceMatrix[startCity][endCity] = distanceMatrix[startCity][intermediateCity] + distanceMatrix[intermediateCity][endCity]
                    }
                }
            }
        }
        
        // Initialize variables to track the city with the minimum number of reachable cities within the distance threshold
        var minimumReachableCities = n
        var resultCity = 0
        
        // Iterate through each city to count the number of reachable cities within the distance threshold
        for currentCity in 0..<n {
            // Initialize the count of reachable cities for the current city
            var reachableCitiesCount = 0
            for otherCity in 0..<n {
                // Check if the other city is different from the current city and within the distance threshold
                if currentCity != otherCity && distanceMatrix[currentCity][otherCity] <= distanceThreshold {
                    reachableCitiesCount += 1
                }
            }
            // Update the result city if the current city has fewer reachable cities or ties with a greater city number
            if reachableCitiesCount < minimumReachableCities || (reachableCitiesCount == minimumReachableCities && currentCity > resultCity) {
                minimumReachableCities = reachableCitiesCount
                resultCity = currentCity
            }
        }
        
        // Return the city with the smallest number of reachable cities within the distance threshold
        return resultCity
    }
}