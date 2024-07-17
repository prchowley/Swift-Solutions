class Solution {
    func mySqrt(_ x: Int) -> Int {
        var l = 1
        var r = x
        
        while l <= r {
            let mid = (l + r) / 2
            let mid_sq = mid * mid            
            
            if mid_sq == x {
                return mid
            } else if mid_sq < x {
                l = mid + 1
            } else if mid_sq > x { 
                r = mid - 1
            }
        }
        
        return r
    }
}