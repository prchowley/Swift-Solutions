class Solution {
    
    // Heap Sort
    func sortArray(_ nums: [Int]) -> [Int] {
        return nums.heapSorted()
    }

    // Quick Sort
    func sortArray2(_ nums: [Int]) -> [Int] {
        return nums.quickSort(lowIndex: 0, highIndex: numbersToSort.count - 1)
    }
}

extension Array where Element: Comparable {
    
    // Method to return a new array that is sorted using heap sort
    func heapSorted() -> [Element] {
        var array = self // Create a mutable copy of the original array
        array.heapSortInPlace() // Perform in-place heap sort on the copy
        return array // Return the sorted array
    }
    
    // In-place heap sort implementation
    private mutating func heapSortInPlace() {
        buildMaxHeap() // Build a max heap from the array
        var heapSize = count // Initialize heapSize to the total number of elements
        
        var i = heapSize - 1 // Start with the last index of the array
        while i > 0 { // Continue until i is greater than 0
            swapAt(0, i) // Swap the root (max element) with the element at index i
            
            heapSize -= 1 // Decrease the heap size by 1, as the last element is now in place
            
            maxHeapify(index: 0, heapSize: heapSize) // Restore the max heap property for the reduced heap
            
            i -= 1 // Move to the previous index in the array
        }
    }
    
    // Build a max heap from the array
    private mutating func buildMaxHeap() {
        let heapSize = count // Get the total number of elements
        
        var index = heapSize / 2 - 1 // Start with the last non-leaf node
        while index >= 0 { // Continue until index is non-negative
            maxHeapify(index: index, heapSize: heapSize) // Ensure the subtree rooted at index is a max heap
            index -= 1 // Move to the previous non-leaf node
        }
    }
    
    // Restore the max heap property for a subtree rooted at the given index
    private mutating func maxHeapify(index: Int, heapSize: Int) {
        let leftChildIndex = 2 * index + 1 // Calculate the left child index
        let rightChildIndex = 2 * index + 2 // Calculate the right child index
        var largestIndex = index // Assume the largest element is the root
        
        if leftChildIndex < heapSize && self[leftChildIndex] > self[largestIndex] {
            largestIndex = leftChildIndex // Update largestIndex if the left child is larger
        }
        
        if rightChildIndex < heapSize && self[rightChildIndex] > self[largestIndex] {
            largestIndex = rightChildIndex // Update largestIndex if the right child is larger
        }
        
        if largestIndex != index { // If the largest element is not the root
            swapAt(index, largestIndex) // Swap the root with the largest element
            maxHeapify(index: largestIndex, heapSize: heapSize) // Recursively heapify the affected subtree
        }
    }
}

extension Array where Element: Comparable {
    mutating func quickSort(lowIndex: Int, highIndex: Int) {
        // Check if the low index is less than the high index to continue sorting
        if lowIndex < highIndex {
            // Partition the array and get the pivot index
            let pivotIndex = medianOfThreePartition(lowIndex: lowIndex, highIndex: highIndex)
            // Recursively sort the elements before the pivot
            quickSort(lowIndex: lowIndex, highIndex: pivotIndex - 1)
            // Recursively sort the elements after the pivot
            quickSort(lowIndex: pivotIndex + 1, highIndex: highIndex)
        }
    }
    
    private mutating func medianOfThreePartition(lowIndex: Int, highIndex: Int) -> Int {
        // Choose the median of the first, middle, and last elements as the pivot
        let middleIndex = lowIndex + (highIndex - lowIndex) / 2
        if self[lowIndex] > self[middleIndex] {
            swapAt(lowIndex, middleIndex)
        }
        if self[lowIndex] > self[highIndex] {
            swapAt(lowIndex, highIndex)
        }
        if self[middleIndex] > self[highIndex] {
            swapAt(middleIndex, highIndex)
        }
        // Use the median as the pivot
        let pivotIndex = middleIndex
        swapAt(pivotIndex, highIndex)
        let pivotElement = self[highIndex]
        
        // Initialize the index for smaller element
        var indexOfSmallerElement = lowIndex
        // Loop through the subarray from the low index to the high index - 1
        for currentIndex in lowIndex..<highIndex {
            // If the current element is less than the pivot
            if self[currentIndex] < pivotElement {
                // Swap the current element with the element at the index of smaller element
                swapAt(indexOfSmallerElement, currentIndex)
                // Increment the index for smaller element
                indexOfSmallerElement += 1
            }
        }
        // Swap the pivot element with the element at the index of smaller element
        swapAt(indexOfSmallerElement, highIndex)
        // Return the index of the pivot element
        return indexOfSmallerElement
    }
}
