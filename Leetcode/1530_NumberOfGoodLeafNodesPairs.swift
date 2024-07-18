class Solution {
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        // Initialize a variable to store the count of good leaf node pairs
        var result = 0
        
        // Depth-First Search (DFS) function to calculate distances of leaf nodes and count pairs
        func dfs(_ node: TreeNode?) -> [Int] {
            // If the node is nil, return an empty array (base case for recursion)
            guard let node = node else { return [] }
            
            // If the node is a leaf (no children), return an array with distance 1
            guard node.left != nil || node.right != nil else { return [1] }
            
            // Recursively calculate distances of leaf nodes in the left subtree
            let leftDistances = dfs(node.left)
            // Recursively calculate distances of leaf nodes in the right subtree
            let rightDistances = dfs(node.right)
            
            // Check combinations of distances from left and right subtrees
            for lDist in leftDistances {
                for rDist in rightDistances {
                    // If the sum of distances is within the allowed distance, increment the result count
                    if lDist + rDist <= distance {
                        result += 1
                    }
                }
            }
            
            // Merge distances from left and right subtrees, incrementing each by 1 for the current node
            // Filter out distances greater than or equal to the allowed distance
            return (leftDistances + rightDistances).compactMap { $0 + 1 < distance ? $0 + 1 : nil }
        }
        
        // Start DFS traversal from the root of the tree
        dfs(root)
        
        // Return the total count of good leaf node pairs found
        return result
    }
}

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */