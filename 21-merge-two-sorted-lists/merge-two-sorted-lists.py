# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        list3 = ListNode()
        cur = list3
        while list1 or list2:
            if list1 is None:
                cur.next = ListNode(list2.val)
                list2 = list2.next
            elif list2 is None:
                cur.next = ListNode(list1.val)
                list1 = list1.next
            elif list1.val < list2.val:
                cur.next = ListNode(list1.val)
                list1 = list1.next
            else:
                cur.next = ListNode(list2.val)
                list2 = list2.next
            cur = cur.next
        return list3.next

#[1,2,4]
#[1,3,4]

