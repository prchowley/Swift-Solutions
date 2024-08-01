class Solution {
    func countSeniors(_ details: [String]) -> Int {
        details.filter { Int($0.suffix(4).prefix(2)) ?? 0 > 60 }.count
    }
}