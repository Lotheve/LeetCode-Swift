//: [Previous](@previous)
/*:
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 Example 1:
 
    nums1 = [1, 3]
    nums2 = [2]
 
 The median is 2.0
 
 Example 2:
 
    nums1 = [1, 2]
    nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */

/*:
 题目要求时间复杂度为O(log (m+n))，因此不能用简单数组合并的方式。

 思路：
 题目为查找两个数组的中位数，可以将其扩展为查找两个数组中第k小的数。
 
 数组是已经排好序的，若要找两个数组中第k小的数，取数组A的前i位数，取数组B的前j位数(要求i+j=k)。
 1. 若A[i-1]<B[j-1],则结果肯定不在A[0]...A[i-1]之间；
 2. 若若A[i-1]>B[j-1],则结果肯定不在B[0]...B[j-1]之间。
 3. 若A[i-1]=B[j-1],则结果就是A[i-1]（或B[n-1]）。
 
 上述1、2情况下将不可能区间从所在数组中移除，然后递归调用
 记m、n为数组A、B的长度,上述i设定应为k/2与m中的较小值
 
 若其中一个数组为空，则结果为另一个数组的第k位。
 若k为1，则结果为两个数组第一位的较小值。
 */

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        if (nums1.count+nums2.count)%2 == 0 {
            let num1 = query(nums1,nums1.count,nums2,nums2.count,(nums1.count+nums2.count)/2)
            let num2 = query(nums1,nums1.count,nums2,nums2.count,(nums1.count+nums2.count)/2+1)
            return Double(num1+num2)/2.0
        } else {
            return Double(query(nums1,nums1.count,nums2,nums2.count,(nums1.count+nums2.count+1)/2))
        }
    }
    
    func query(_ A:[Int], _ m:Int, _ B:[Int], _ n:Int, _ k:Int) -> Int {
        
        if m > n {
            return query(B,n,A,m,k)
        }
        if m == 0 {
            return B[k-1]
        }
        if k == 1 {
            return A[0] < B[0] ? A[0] : B[0]
        }
        
        let i = k/2 < m ? k/2 : m
        let j = k - i
        
        if A[i-1] < B[j-1] {
            return query(i <= m-1 ? Array(A[i...]) : [], m-i, B, n, k-i)
        } else if A[i-1] > B[i-1] {
            return query(A, m ,Array(j <= n-1 ? B[j...n-1] : []), n-j, k-j)
        } else {
            return A[i-1]
        }
    }
}

let so = Solution()
let result = so.findMedianSortedArrays([1,5,6,8,12,15],[2,5,7,8])
print(result)

//: [Next](@next)
