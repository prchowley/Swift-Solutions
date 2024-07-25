# LeetCode Solutions

This repository contains my solutions to various LeetCode problems. Each solution is implemented in Swift and organized by problem number and title.

I will update this when ever I will get some time.

## Table of Contents

<!-- TOC start -->
- [1. Two Sum](./Leetcode/1_TwoSum.swift)
- [2. Add Two Numbers](./Leetcode/2_AddTwoNumbers.swift)
- [3. Longest Substring Without Repeating Characters](./Leetcode/3_LongestSubstringWithoutRepeatingCharacters.swift)
- [4. Median Of Two Sorted Arrays](./Leetcode/4_MedianOfTwoSortedArrays.swift)
- [7. Reverse Integer](./Leetcode/7_ReverseInteger.swift)
- [9. Palindrome Number](./Leetcode/9_PalindromeNumber.swift)
- [13. Roman To Integer](./Leetcode/13_RomanToInteger.swift)
- [14. Longest Common Prefix](./Leetcode/14_LongestCommonPrefix.swift)
- [20. Valid Parentheses](./Leetcode/20_ValidParentheses.swift)
- [21. Merge Two Sorted Lists](./Leetcode/21_MergeTwoSortedLists.swift)
- [26. Remove Duplicates From Sorted Array](./Leetcode/26_RemoveDuplicatesFromSortedArray.swift)
- [27. Remove Element](./Leetcode/27_RemoveElement.swift)
- [28. Find The Index Of The First Occurrence In AString](./Leetcode/28_FindTheIndexOfTheFirstOccurrenceInAString.swift)
- [35. Search Insert Position](./Leetcode/35_SearchInsertPosition.swift)
- [49. Group Anagrams](./Leetcode/49_GroupAnagrams.swift)
- [58. Length Of Last Word](./Leetcode/58_LengthOfLastWord.swift)
- [66. Plus One](./Leetcode/66_PlusOne.swift)
- [67. Add Binary](./Leetcode/67_AddBinary.swift)
- [69. Sqrt(x)](./Leetcode/69_Sqrt(x).swift)
- [70. Climbing Stairs](./Leetcode/70_ClimbingStairs.swift)
- [912. Sort An Array](./Leetcode/912_SortAnArray.swift)
- [1380. Lucky Numbers In AMatrix](./Leetcode/1380_LuckyNumbersInAMatrix.swift)
- [1530. Number Of Good Leaf Nodes Pairs](./Leetcode/1530_NumberOfGoodLeafNodesPairs.swift)
- [1636. Sort Array By Increasing Frequency](./Leetcode/1636_SortArrayByIncreasingFrequency.swift)
- [2191. Sort The Jumbled Numbers](./Leetcode/2191_SortTheJumbledNumbers.swift)
- [2418. Sort The People](./Leetcode/2418_SortThePeople.swift)
- [3074. Apple Redistribution Into Boxes](./Leetcode/3074_AppleRedistributionIntoBoxes.swift)
<!-- TOC end -->

## How to Use

1. Clone the repository.
    ```sh
    git clone https://github.com/prchowley/LC-HR-Solutions-In-Swift.git
    ```
2. Navigate to the repository directory.
    ```sh
    cd leetcode-solutions
    ```
3. Find the solution you are interested in by browsing the file names or using the Table of Contents above.

## Solutions

Each file is named with the problem number and the problem title in CamelCase. For example, a solution for problem 1 (Two Sum) would be named `1_TwoSum.swift`.

### Example

```swift
// 1_TwoSum.swift
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
