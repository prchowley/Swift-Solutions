func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(0)
    var p = l1, q = l2, current: ListNode? = dummyHead
    var carry = 0
    
    while p != nil || q != nil {
        let x = p?.val ?? 0
        let y = q?.val ?? 0
        let sum = carry + x + y
        carry = sum / 10
        current?.next = ListNode(sum % 10)
        current = current?.next
        if p != nil { p = p?.next }
        if q != nil { q = q?.next }
    }
    
    if carry > 0 {
        current?.next = ListNode(carry)
    }
    
    return dummyHead.next
}