class Solution {
    func findComplement(_ num: Int) -> Int {
        // Step 1: Calculate the bit length of the number.
        // The bit length is determined by finding the position of the highest set bit in the number.
        let bitLength: Int = Int(log2(Double(num))) + 1
        
        // Step 2: Create a bitmask with all bits set to 1 for the calculated bit length.
        // The bitmask is created by shifting 1 to the left by the bit length and then subtracting 1.
        let bitmask: Int = (1 << bitLength) - 1
        
        // Step 3: Calculate the complement by performing an XOR operation between the number and the bitmask.
        // XOR operation will flip the bits of the number within the range defined by the bitmask.
        let complement: Int = num ^ bitmask
        
        // Return the calculated complement.
        return complement
    }
}