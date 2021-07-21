import Foundation

// 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest
// Discuss: https://vk.cc/c3HTmo

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums
        nums.sort()
        var diff = Int.max, res = 0
        for i in 0..<nums.count - 2 {
            var n = i + 1, q = nums.count - 1
            while n < q {
                let sum = nums[i] + nums[n] + nums[q]
                sum > target ? q -= 1 : (n += 1)
                let val =  abs(sum - target)
                if val < diff { diff = val; res = sum }
            }
        }
        return res
    }
}

import XCTest

// Executed 1 test, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test() {
        XCTAssert(s.threeSumClosest([-1,2,1,-4], 1) == 2) // success
    }
}

Tests.defaultTestSuite.run()
