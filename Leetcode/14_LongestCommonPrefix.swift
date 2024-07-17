class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // Finding the min string from the array of string
        var minString = strs.first ?? ""
        for str in strs[1..<strs.count] {
            if str.count < minString.count {
                minString = str
            }
        }

        // now looping through the minString to find the common prefix
        var pref = ""
        for char in Array(minString) {
            var p = true
            loop: for str in strs {
                p = p && str.hasPrefix("\(pref)\(char)")
            }
            if p {
                pref += "\(char)"
            }
        }

        return "\(pref)"
    }
}
