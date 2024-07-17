class Solution {
    func reverse(_ x: Int) -> Int {
        var rev = 0
        var _x = abs(x)
        while _x > 0 {
            let mod = _x % 10
            if rev > (Int(Int32.max) - mod) / 10 { return 0 }
            rev = (rev * 10) + mod
            _x /= 10
        }
        
        let r = x < 0 ? -rev : rev
        if r < Int32.min || r > Int32.max { return 0 }
        return r
    }
}