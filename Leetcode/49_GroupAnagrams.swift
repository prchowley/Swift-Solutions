class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [[Character: Int]: [String]] = [:]
        for str in strs {
            var freqMap: [Character: Int] = [:]
            for c in str {
                freqMap[c, default: 0] += 1
            }
            map[freqMap, default: []].append(str ?? "")
        }
        return Array(map.values)
    }
}