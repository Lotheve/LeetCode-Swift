//: [Previous](@previous)

/*:
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

    Example:
 
    Given nums = [2, 7, 11, 15], target = 9,
    Because nums[0] + nums[1] = 2 + 7 = 9,
    return [0, 1].
 
 [Two Sum](https://leetcode.com/problems/two-sum/description/)
*/

//: 思路：遍历数组，计算目标值与当前值的差，若差值在字典中不存在，则以当前值为键，以当前值的索引为值保存到字典中；若差值在字典中以key存在，则取该key对应的值与当前值的索引为结果。

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var numDic = [Int:Int]()
    
    for (index,num) in nums.enumerated() {
        if let preIndex = numDic[target - num] {
            return [preIndex, index]
        } else {
            numDic[num] = index
        }
    }
    
    return [-1,-1]
}

twoSum([2,7,11,15], 9)
//: [Next](@next)
