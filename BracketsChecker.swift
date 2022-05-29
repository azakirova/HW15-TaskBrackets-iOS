import Foundation

func checkBrackets(string: String) -> Int {
    if string.isEmpty {
        return -1
    }

    let openBracket: [Character] = ["[", "{", "("]
    let closeBracket: [Character] = ["]", "}", ")"]
    var stack: [(bracket: Character, index: Int)] = []

    for (i, element) in string.enumerated() {
        if openBracket.contains(element) {
            stack.append((bracket: element, index: i))
        }
        if closeBracket.contains(element) {
            if stack.isEmpty {
                return i + 1
            }
            let head = stack.last!.bracket
            if convertToOpenBracket(element) == head {
                stack.removeLast()
            } else {
                return i + 1
            }
        }
    }
    if stack.isEmpty {
        return -1
    } else {
        return stack.first!.index + 1
    }
}

func convertToOpenBracket(_ symbol: Character) -> Character {
    switch symbol {
    case "]": return "["
    case "}": return "{"
    case ")": return "("
    default: return " "
    }
}


// Test

// let examples = [
//     "[ ]",
//     "{ [ ] }",
//     "{",
//     "foo(bar)",
//     "foo(bar[i)",
//     "(){12}(po1)(12)",
//     "{12}([w])1",
//     "({12}(po1)12)",
//     "123-{1}",
//     "{[}",
//     "([]))[",
//     "foo(bar[i)",
//      ")[1]2[3](",
//     "",
//     "[()]",
//     "([()]{})",
//     "{12()}[(asd)]",
// ]

// for example in examples {
//     print("\(example) -> \(checkBrackets(string: example))")
// }

