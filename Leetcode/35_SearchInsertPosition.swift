class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 { return 0 }

        var l = 0
        var r = nums.count - 1

        while l <= r {
            let mid = (l + r) / 2
            if target < nums[mid] {
                r = mid - 1
            } else if target > nums[mid] {
                l = mid + 1
            } else { return mid }
        }
        return l
    }
}