import Foundation

// https://leetcode.com/problems/recover-binary-search-tree

class Solution {
    var left: TreeNode?, right: TreeNode?, prev: TreeNode?
    func recoverTree(_ root: TreeNode?) {
        bfs(root)
        if let l = left, let r = right {
            let temp = l.val
            l.val = r.val
            r.val = temp
        }
    }
    private func bfs(_ node: TreeNode?) {
        guard let node = node else { return }
        bfs(node.left)
        if left == nil, let prev = prev, prev.val > node.val {
            left = prev
        }
        if left != nil {
            if right == nil {
                right = node
            } else if node.val < right!.val {
                right = node
            }
        }
        prev = node
        bfs(node.right)
    }
}

// MARK: - Tests

import XCTest

//      Executed 2 tests, with 0 failures (0 unexpected) in 0.561 (0.563) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let tree = TreeNode([1,3,nil,nil,2])
        s.recoverTree(tree)
        XCTAssertEqual(tree, TreeNode([3,1,nil,nil,2]))
    }
    func test2() {
        let tree = TreeNode([3,1,4,nil,nil,2])
        s.recoverTree(tree)
        XCTAssertEqual(tree, TreeNode([2,1,4,nil,nil,3]))
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    public init?(_ array: [Int?]) {
        var values = array
        guard !values.isEmpty, let head = values.removeFirst() else { return nil }
        
        val = head; left = nil; right = nil
        
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !values.isEmpty, let val = values.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
}

// To pass the tests

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
}
