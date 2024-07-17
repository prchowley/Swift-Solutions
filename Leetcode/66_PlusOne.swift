class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var carried = 1
        var plusOneDigits = digits

        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            let newSum = carried + plusOneDigits[i]
            if newSum >= 10 {
                carried = 1
                plusOneDigits[i] = newSum % 10
            } else {
                carried = 0
                plusOneDigits[i] = newSum
                break
            }
        }

        if (carried > 0) {
            plusOneDigits.insert(1, at: 0)
        }

        return plusOneDigits
    }
}