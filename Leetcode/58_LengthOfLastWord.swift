class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").filter{ $0.count > 0 }.last?.count ?? 0
    }
}