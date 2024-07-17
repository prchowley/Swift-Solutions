class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }

        var oNumber = x
        var reversedNumber = 0

        while oNumber > 0 {
            let digit = oNumber % 10
            reversedNumber = reversedNumber * 10 + digit
            oNumber /= 10
        }

        return x == reversedNumber
    }
}