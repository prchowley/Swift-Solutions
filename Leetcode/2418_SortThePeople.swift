class Solution {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
       return zip(heights, names).sorted { $0.0 > $1.0 }.map { $0.1 }
    }
}