# [29. Divide Two Integers](https://leetcode.com/problems/divide-two-integers/)

[Discuss](https://leetcode.com/problems/divide-two-integers/discuss/1163652/Swift%3A-Divide-Two-Integers)

### Solution:
```swift
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let negative = (dividend < 0) == (divisor < 0)
        var _dividend = Int64(abs(dividend))
        let _divisor = Int64(abs(divisor))
        
        var count = 0, t = 1, divisor = _divisor
        
        while divisor < _dividend {
            divisor = divisor << 1
            t = t << 1
        }
        
        while divisor > 0, divisor > _divisor {
            while divisor > _dividend {
                divisor = divisor >> 1
                t = t >> 1
            }
            _dividend -= divisor
            count += t
        }
        if _dividend == _divisor { count += 1 }
        return negative ? min(count, Int(Int32.max)) : max(-count, Int(Int32.min))
    }
}
```

### Description:

<div><p>Given two integers <code>dividend</code> and <code>divisor</code>, divide two integers without using multiplication, division, and mod operator.</p>

<p>Return the quotient after dividing <code>dividend</code> by <code>divisor</code>.</p>

<p>The integer division should truncate toward zero, which means losing its fractional part. For example, <code>truncate(8.345) = 8</code> and <code>truncate(-2.7335) = -2</code>.</p>

<p><strong>Note: </strong>Assume we are dealing with an environment that could only store integers within the <strong>32-bit</strong> signed integer range: <code>[−2<sup>31</sup>, 2<sup>31</sup> − 1]</code>. For this problem, assume that your function <strong>returns </strong><code>2<sup>31</sup> − 1</code><strong> when the division result overflows</strong>.</p>

<p>&nbsp;</p>
<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> dividend = 10, divisor = 3
<strong>Output:</strong> 3
<strong>Explanation:</strong> 10/3 = truncate(3.33333..) = 3.
</pre>

<p><strong>Example 2:</strong></p>

<pre><strong>Input:</strong> dividend = 7, divisor = -3
<strong>Output:</strong> -2
<strong>Explanation:</strong> 7/-3 = truncate(-2.33333..) = -2.
</pre>

<p><strong>Example 3:</strong></p>

<pre><strong>Input:</strong> dividend = 0, divisor = 1
<strong>Output:</strong> 0
</pre>

<p><strong>Example 4:</strong></p>

<pre><strong>Input:</strong> dividend = 1, divisor = 1
<strong>Output:</strong> 1
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>-2<sup>31</sup> &lt;= dividend, divisor &lt;= 2<sup>31</sup> - 1</code></li>
	<li><code>divisor != 0</code></li>
</ul>
</div>