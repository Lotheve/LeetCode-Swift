//: [Previous](@previous)

/*:
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
    Given "abcabcbb", the answer is "abc", which the length is 3.
 
    Given "bbbbb", the answer is "b", with the length of 1.
 
    Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/description/)
 */

//:思路：借助字典，以字符为key，索引为值保存字符信息
import Foundation


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var length = 0
        var boundIndex = 0
        
        var hashMap:[Character:Int] = [:]
        
        for (curIndex,c) in s.enumerated() {

            if let existIndex = hashMap[c], existIndex >= boundIndex {
                boundIndex = existIndex+1
            } else if curIndex - boundIndex + 1 > length {
                length = curIndex - boundIndex + 1
            }
            hashMap[c] = curIndex
        }
        
        if length == 0 {
            length = s.count
        }
        return length
    }
}

let so = Solution()
let str = "tmmzuxt"
print("result:\(so.lengthOfLongestSubstring(str))")

//: [Next](@next)
