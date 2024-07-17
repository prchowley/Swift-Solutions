/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let startNode = ListNode(0)

        var tail = startNode
        
        var node1 = list1
        var node2 = list2
        
        while let n1 = node1, let n2 = node2 {
            
            // if the node1 value is bigger then add the node1 to tail.next
            // and update the node1 withut the added node
            if n1.val < n2.val {
                tail.next = n1
                node1 = n1.next
            } else {

                // Do the same for node 2
                tail.next = n2
                node2 = n2.next
            }

            // moving down the tail to the added node
            tail = tail.next!
        }

        // appending the remaining nodes 
        tail.next = node1 ?? node2
        return startNode.next
    }
}