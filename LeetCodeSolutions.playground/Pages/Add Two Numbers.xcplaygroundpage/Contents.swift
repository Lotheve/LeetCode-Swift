//: [Previous](@previous)

/*:
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example
 
    Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 0 -> 8
    Explanation: 342 + 465 = 807.
 
 [Add Two Numbers](https://leetcode.com/problems/add-two-numbers/description/)
 */



import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var result:ListNode?
        var resultp:ListNode?
        
        var l1p = l1
        var l2p = l2
        
        var carry = false
        
        while let p1 = l1p, let p2 = l2p {

            let num = Solution.handleCarry(p1.val + p2.val, carry: &carry)
            
            let node = ListNode(num)
            
            if result == nil {
                result = node
                resultp = node
            } else {
                resultp?.next = node
                resultp = node
            }
            
            l1p = l1p?.next
            l2p = l2p?.next
        }

        if l1p == nil {
            while let p2 = l2p {
                
                let num = Solution.handleCarry(p2.val, carry: &carry)
                
                p2.val = num
                
                resultp?.next = p2
                resultp = p2
                
                l2p = l2p?.next
            }
        } else if l2p == nil {
            while let p1 = l1p {
                
                let num = Solution.handleCarry(p1.val, carry: &carry)
                
                p1.val = num
                
                resultp?.next = p1
                resultp = p1
                
                l1p = l1p?.next
            }
        }
        
        if carry {
            let tail = ListNode(1)
            resultp?.next = tail
        }
        
        return result
    }
    
    class func handleCarry(_ num:Int,  carry:inout Bool) -> Int {
        
        var n = num
        if carry {
            n += 1
        }
        if n > 9 {
            n -= 10
            carry = true
        } else {
            carry = false
        }
        
        return n
    }
}

//2->4->3
var l1 = ListNode(2)
var node4 = ListNode(4)
var node3 = ListNode(3)
l1.next = node4
node4.next = node3

//5->6->9->8->7
var l2 = ListNode(5)
var node6 = ListNode(6)
var node9 = ListNode(9)
var node8 = ListNode(8)
var node7 = ListNode(7)
l2.next = node6
node6.next = node9
node9.next = node8
node8.next = node7

let solution = Solution()
let result = solution.addTwoNumbers(l1, l2)

var p = result

while let point = p {
    print(point.val)
    p = p?.next
}

//: [Next](@next)
