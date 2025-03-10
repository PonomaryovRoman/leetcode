
### [953. Verifying an Alien Dictionary](https://leetcode.com/problems/verifying-an-alien-dictionary)

In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

#### Example 1:
```swift
Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
Output: true
Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
```

#### Example 2:
```swift
Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
Output: false
Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
```

#### Example 3:
```swift
Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
Output: false
Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
```

#### Constraints:
```swift
1 <= words.length <= 100
1 <= words[i].length <= 20
order.length == 26

All characters in words[i] and order are English lowercase letters.
```

### Solution
```swift
import UIKit
import XCTest

// https://leetcode.com/problems/verifying-an-alien-dictionary/

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let order = Array(order)
        var last = words[0] // last word
        for i in 1..<words.count {
            let current = words[i]
            let min = Swift.min(current.count, last.count)
            for j in 0..<min {
                let ci = order.firstIndex(of: Array(current)[j]) ?? 0 // current index
                let li = order.firstIndex(of: Array(last)[j]) ?? 0 // last index
                if ci > li { break }
                else if ci < li || (j == min - 1 && current.count < last.count) { return false }
            }
            last = current
        }
        return true
    }
}


class SolutionTests: XCTestCase {
    private var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = .init()
    }
    
    func testAsserts() {
        XCTAssertTrue(solution.isAlienSorted(["hello","leetcode"],"hlabcdefgijkmnopqrstuvwxyz"))
        XCTAssertFalse(solution.isAlienSorted(["word","world","row"],"worldabcefghijkmnpqstuvxyz"))
        XCTAssertTrue(solution.isAlienSorted(["kuvp","q"],"ngxlkthsjuoqcpavbfdermiywz"))
        XCTAssertFalse(solution.isAlienSorted(["apple","app"],"abcdefghijklmnopqrstuvwxyz"))
        XCTAssertTrue(solution.isAlienSorted(["mtkwpj","wlaees"],"evhadxsqukcogztlnfjpiymbwr"))
    }
}

SolutionTests.defaultTestSuite.run()
```
