class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 { return 1 }

        var one = 1
        var two = 1
        
        for i in 2...n {
            let temp = two
            two = one + two
            one = temp
        }
        
        return two
    }
}