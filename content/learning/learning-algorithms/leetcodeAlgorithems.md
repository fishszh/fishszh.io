---
title: "LeetCode"
date: 2019-08-25
weight: 201
# markup: mmark
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
menu: 
    learning-algorithms:
---
---
<!--more-->

- [1. 两数之和](#1-两数之和)
- [2. 整数反转](#2-整数反转)
- [3. 回文数](#3-回文数)
- [4. 罗马数字转整数](#4-罗马数字转整数)
- [5. 最长公共前缀](#5-最长公共前缀)
- [6. 有效的括号](#6-有效的括号)
- [7. 合并两个有序列表](#7-合并两个有序列表)
- [8. 删除数组中重复项](#8-删除数组中重复项)

## 1. 两数之和

问题描述：
给定一个整数数组 `nums` 和一个目标值 `target`，请你在该数组中找出和为目标值的那 **两个** 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
<!--more-->

解析：
这里主要是利用哈希表查找的复杂度为`O(1)`，再一个就是一遍便利的方法。

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        dic = {}
        for i, num in enumerate(nums):
            if target - num in dic:
                return [dic[target-num], i]
            dic[num] = i
```

注意： 这里不能解决重复的问题，例如`nums=[3,3]`,`target=6`.

## 2. 整数反转

问题描述：
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

注意:

假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

解析：
这里主要是利用哈希表查找的复杂度为`O(1)`，再一个就是一遍便利的方法。

```python
class Solution:
    def reverse(self, x: int) -> int:
        if -2**31>temp or temp>2**31-1:
            return 0
        flag = 1 if x>0 else -1
        temp = 0
        x = abs(x)
        while x !=0:
            temp  = temp*10 + x%10
            x //= 10
        if -2**31>temp or temp>2**31-1:
            return 0
        return flag*temp
```

## 3. 回文数

问题描述:

判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
<!--more-->

进阶:

你能不将整数转为字符串来解决这个问题吗？

```python
class Solution:
    def isPalindrome(self, x: int) -> bool:
        list_x = list(str(x))
        list_x_r = list_x.copy()
        list_x_r.reverse()
        return list_x == list_x
```

## 4. 罗马数字转整数

**问题描述**:

罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

字符        |  数值
-----------|------
I          |  1
V          |   5
X          |   10
L          |   50
C          |   100
D          |   500
M          |   1000

例如， 罗马数字 `2` 写做 `II` ，即为两个并列的 `1`。`12` 写做 `XII` ，即为 `X + II` 。 `27` 写做  `XXVII`, 即为 `XX + V + II` 。

通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 `4` 不写做 `IIII`，而是 `IV`。数字 `1` 在数字 `5` 的左边，所表示的数等于大数 `5` 减小数 `1` 得到的数值 `4` 。同样地，数字 `9` 表示为 `IX`。这个特殊的规则只适用于以下六种情况：

`I` 可以放在 `V (5)` 和 `X (10)` 的左边，来表示 `4` 和 `9`。
`X` 可以放在 `L (50)` 和 `C (100)` 的左边，来表示 `40` 和 `90`。
`C` 可以放在 `D (500)` 和 `M (1000)` 的左边，来表示 `400` 和 `900`。
给定一个罗马数字，将其转换成整数。输入确保在 `1` 到 `3999` 的范围内。

```python
class Solution:
    def romanToInt(self, s: str) -> int:
        romanDict={'I':1, 'V':5, 'X':10, 'L':50, 'C':100, 'D':500, 'M':1000}
        romanList = list(s)
        romanList.reverse()
        romanInt = 0
        pre = 0
        for x in romanList:
            romanInt = romanInt-romanDict[x] if romanDict[x]<pre else romanInt+romanDict[x]
            pre  = romanDict[x]
        return romanInt
```

## 5. 最长公共前缀

问题描述

编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

说明:

所有输入只包含小写字母 a-z 。

解析：
本题要注意`strs=[]`的情况，找到最短的，再跟另一个对比就能得到了。

```python
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if not strs:
            return ''
        s1 = min(strs)
        s2 = max(strs)
        for i, c in enumerate(s1):
            if not c == s2[i]:
                return s2[:i]
        return s1
```

## 6. 有效的括号

题目描述

给定一个只包括 `'('`，`')'`，`'{'`，`'}'`，`'['`，`']'` 的字符串，判断字符串是否有效。

有效字符串需满足：

- 左括号必须用相同类型的右括号闭合。
- 左括号必须以正确的顺序闭合。

**注意**：空字符串可被认为是有效字符串。

```python
class Solution:
    def isValid(self, s: str) -> bool:
        kuohaoDict = {')':'(', '}':'{', ']':'['}
        stack = []

        for char in s:
            if char in kuohaoDict:
                top_element = stack.pop() if stack else '#'
                if kuohaoDict[char] != top_element:
                    return False
            else:
                stack.append(char)

        return not stack
```

## 7. 合并两个有序列表

问题描述：

将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

分析：

我们可以如下递归地定义在两个链表里的 merge 操作（忽略边界情况，比如空链表等）：

$$\left\{ 
\begin{array}{ll}
list1[0] + merge(list1[1:], list2) & list1[0] < list2[0] \\
list2[0] + merge(list1, list2[1:]) & otherwise \\
\end{array}
\right}$$

也就是说，两个链表头部较小的一个与剩下元素的 merge 操作结果合并。

算法:

我们直接将以上递归过程建模，首先考虑边界情况。
特殊的，如果 l1 或者 l2 一开始就是 null ，那么没有任何操作需要合并，所以我们只需要返回非空链表。否则，我们要判断 l1 和 l2 哪一个的头元素更小，然后递归地决定下一个添加到结果里的值。如果两个链表都是空的，那么过程终止，所以递归过程最终一定会终止。

```python
class Solution: 
    def mergeTwoLists(self, l1:ListNode, l2:ListNode)->ListNode:
        if l1 is None:
            return l2
        elif l2 is None:
            return l1
        elif l1.value < l2.value:
            l1.next = mergeTwoLists(l1.next, l2)
            retun l1
        else:
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
```

复杂度分析：
时间复杂度为： `O(n+m)`

## 8. 删除数组中重复项

问题描述：

给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

说明:

为什么返回数值是整数，但输出的答案是数组呢?
请注意，输入数组是以“引用”方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
你可以想象内部操作如下:

```c++
// nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
int len = removeDuplicates(nums);

// 在函数里修改输入数组对于调用者是可见的。
// 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
for (int i = 0; i < len; i++) {
    print(nums[i]);
}
```

```python
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
      uniNums = list(set(nums))
      uniNums.sort()
      nums[:len(uniNums)] = uniNums
      return len(uniNums)
```
