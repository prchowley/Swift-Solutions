import Foundation

/* 
Dry Run for Test Case:
- **Start Node:** `0`
- **End Node:** `2`
- **Edges:** `[[0,1],[1,2],[0,2]]`
- **Success Probabilities:** `[0.5, 0.5, 0.2]`

**Step-by-step execution:**

1. **Initialize the graph:**
   - `graph[0] = [(1, 0.5), (2, 0.2)]`
   - `graph[1] = [(0, 0.5), (2, 0.5)]`
   - `graph[2] = [(1, 0.5), (0, 0.2)]`

2. **Start processing with startNode = 0:**
   - `maxHeap = [(0, 1.0)]`
   - `maximumProbability = [1.0, 0.0, 0.0]`

3. **Pop `(0, 1.0)` from maxHeap:**
   - **Current Node = 0**, **Accumulated Probability = 1.0**
   - Explore neighbors of Node 0:
     - **Neighbor 1:** `New Probability = 1.0 * 0.5 = 0.5`
       - Update `maximumProbability[1] = 0.5`
       - Push `(1, 0.5)` to `maxHeap`
     - **Neighbor 2:** `New Probability = 1.0 * 0.2 = 0.2`
       - Update `maximumProbability[2] = 0.2`
       - Push `(2, 0.2)` to `maxHeap`
   - `maxHeap = [(1, 0.5), (2, 0.2)]`

4. **Pop `(1, 0.5)` from maxHeap:**
   - **Current Node = 1**, **Accumulated Probability = 0.5**
   - Explore neighbors of Node 1:
     - **Neighbor 0:** `New Probability = 0.5 * 0.5 = 0.25` _(Not greater than `maximumProbability[0]`)_
     - **Neighbor 2:** `New Probability = 0.5 * 0.5 = 0.25`
       - Update `maximumProbability[2] = 0.25` _(higher than previous 0.2)_
       - Push `(2, 0.25)` to `maxHeap`
   - `maxHeap = [(2, 0.25), (2, 0.2)]`

5. **Pop `(2, 0.25)` from maxHeap:**
   - **Current Node = 2**, **Accumulated Probability = 0.25**
   - Since Current Node is the End Node, return `0.25`

**Final result:** `0.25`
*/

class Solution {
    func maxProbability(
        _ numberOfNodes: Int, 
        _ edges: [[Int]], 
        _ successProbabilities: [Double], 
        _ startNode: Int, 
        _ endNode: Int
    ) -> Double {
        
        // Initialize an adjacency list to represent the graph where each node points to a list of tuples
        // Each tuple contains a neighboring node and the probability of moving to that neighbor
        var graph: [[(neighborNode: Int, edgeProbability: Double)]] = Array(
            repeating: [], 
            count: numberOfNodes
        )
        
        // Populate the adjacency list using the edges and corresponding probabilities
        for edgeIndex in 0..<edges.count {
            let firstNode: Int = edges[edgeIndex][0] // First node in the current edge
            let secondNode: Int = edges[edgeIndex][1] // Second node in the current edge
            let edgeProbability: Double = successProbabilities[edgeIndex] // Probability of traveling along this edge

            // Add the bidirectional relationship in the graph
            graph[firstNode].append((neighborNode: secondNode, edgeProbability: edgeProbability))
            graph[secondNode].append((neighborNode: firstNode, edgeProbability: edgeProbability))
        }
        
        // Priority queue (Max-Heap) to store and retrieve nodes based on maximum probability path so far
        var maxHeap: [(currentNode: Int, accumulatedProbability: Double)] = []
        maxHeap.append((startNode, 1.0)) // Start with the startNode and a probability of 1.0 (100%)
        
        // Array to track the maximum probability to reach each node from the startNode
        var maximumProbability: [Double] = Array(repeating: 0.0, count: numberOfNodes)
        maximumProbability[startNode] = 1.0 // The probability of being at the startNode is 1.0
        
        // Process the heap until all possible paths have been explored
        while !maxHeap.isEmpty {
            // Pop the node with the highest probability from the heap
            let currentElement = maxHeap.removeFirst()
            let currentNode: Int = currentElement.currentNode
            let currentAccumulatedProbability: Double = currentElement.accumulatedProbability
            
            // If we reached the endNode, return the accumulated probability
            if currentNode == endNode {
                return currentAccumulatedProbability
            }
            
            // Traverse all neighbors of the current node
            for neighbor in graph[currentNode] {
                let neighborNode: Int = neighbor.neighborNode
                let edgeProbability: Double = neighbor.edgeProbability
                let newAccumulatedProbability: Double = currentAccumulatedProbability * edgeProbability
                
                // If the new path provides a higher probability, update and push to the heap
                if newAccumulatedProbability > maximumProbability[neighborNode] {
                    maximumProbability[neighborNode] = newAccumulatedProbability
                    maxHeap.append((neighborNode, newAccumulatedProbability))
                }
            }
            
            // Maintain the max-heap property by sorting the heap based on probabilities in descending order
            maxHeap.sort { $0.accumulatedProbability > $1.accumulatedProbability }
        }
        
        // If no path from startNode to endNode was found, return 0.0
        return 0.0
    }
}