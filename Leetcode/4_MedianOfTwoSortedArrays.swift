func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let allItems = (nums1 + nums2).sorted()
    if allItems.count % 2 == 0 {
        let div = allItems.count / 2;
        let x: Double = (Double(allItems[div - 1]) +  Double(allItems[div])) / 2
        return x
    } else {
        return Double(allItems[allItems.count / 2])
    }
}