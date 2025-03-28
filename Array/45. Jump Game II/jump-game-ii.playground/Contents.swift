import Foundation

// 45. Jump Game II
// https://leetcode.com/problems/jump-game-ii/

class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard 1 <= nums.count && nums.count <= Int(10e4) else { return 0 }
        var step = 0, end = 0, maxPos = 0
        for i in 0..<nums.count - 1 {
            maxPos = max(maxPos, i + nums[i])
            if i == end { end = maxPos; step += 1 }
        }
        return step
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.jump([2,3,1,1,4])
        XCTAssertEqual(res, 2)
    }
    func test1() {
        let res = s.jump([2,3,0,1,4])
        XCTAssertEqual(res, 2)
    }
}

Tests.defaultTestSuite.run()
