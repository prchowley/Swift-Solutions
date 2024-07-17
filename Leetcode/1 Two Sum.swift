func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hash: [Int: Int] = [:]

    for (index, n) in nums.enumerated() {
        if let hashN = hash[n] {
            return [index, hashN]
        }
            hash[target - n] = index
    }
    return []
}