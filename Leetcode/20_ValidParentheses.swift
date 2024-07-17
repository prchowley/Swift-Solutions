class Solution {
    func isValidClose(openedBy: String, closedBy: String) -> Bool {
        return openedBy == "(" && closedBy == ")" || openedBy == "{" && closedBy == "}" || openedBy == "[" && closedBy == "]"
    }
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var stack = [String]()
        for c in s {
            let isValidClose = isValidClose(openedBy: stack.last ?? "", closedBy: "\(c)");
            if c == "(" || c == "{" || c == "[" {
                stack.append("\(c)")
            } else if !isValidClose {
                return false
            } else if isValidClose {
                stack.removeLast()
            }
        }

        return stack.isEmpty
    }
}