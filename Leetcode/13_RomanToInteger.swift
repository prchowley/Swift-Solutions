class Solution {
    func romanToInt(_ s: String) -> Int {
        let mapRomanSym: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        var arrS = Array(s)
        var total = 0
        var prevValue = 0

        for index in 0..<s.count {
            if let currentValue = mapRomanSym[arrS[index]] {
                
                if index < s.count - 1, 
                    let nextValue = mapRomanSym[arrS[index + 1]], 
                    currentValue < nextValue {
                    
                    total -= currentValue
                } else {
                    total += currentValue
                }
            }
        }

        return total
    }
}