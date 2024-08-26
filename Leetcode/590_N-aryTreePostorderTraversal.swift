/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    /// Performs a postorder traversal of an n-ary tree and returns the values in postorder.
    /// - Parameter root: The root node of the n-ary tree.
    /// - Returns: An array of integers representing the node values in postorder.
    func postorder(_ root: Node?) -> [Int] {
        // Initialize an array to store the result of the postorder traversal
        var traversalResult: [Int] = []
        
        /// Helper function to perform postorder traversal on the given node.
        /// - Parameter currentNode: The current node being processed in the traversal.
        func traverseNode(_ currentNode: Node?) {
            // Check if the current node is nil (base case)
            guard let unwrappedCurrentNode = currentNode else {
                return
            }
            
            // Iterate over each child node of the current node
            for childNode in unwrappedCurrentNode.children {
                // Recursively traverse each child node
                traverseNode(childNode)
            }
            
            // After traversing all child nodes, append the current node's value to the result
            traversalResult.append(unwrappedCurrentNode.val)
        }
        
        // Start the traversal from the root node
        traverseNode(root)
        
        // Return the final result containing the values in postorder
        return traversalResult
    }
}