class Solution {
    func addBinary(_ a: String, _ b: String) -> String {

        let aChars = Array(a)
        let bChars = Array(b)
        var result = ""
        var carry = 0

        var i  = aChars.count - 1
        var j = bChars.count - 1

        while i >= 0 || j >= 0 || carry > 0 {
            let digitA = i >= 0 ? Int(String(aChars[i]))! : 0
            let digitB = j >= 0 ? Int(String(bChars[j]))! : 0

            let sum = digitA + digitB + carry
            carry = sum / 2
            result = "\(sum % 2)" + result

            i -= 1
            j -= 1
        }

        return result
    }
}