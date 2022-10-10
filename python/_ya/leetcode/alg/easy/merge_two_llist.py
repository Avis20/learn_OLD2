# Definition for singly-linked list.

from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __repr__(self):
        return self.val

class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        print(list2.next)


if __name__ == "__main__":
    """
    Ссылка:
    Дано:
    Необходимо:
    Примечание:
    """
    solution = Solution()
    
    first_node1 = ListNode(1)
    sec_node1 = ListNode(2)

    first_node2 = ListNode(1)
    sec_node2 = ListNode(3)

    print(solution.mergeTwoLists(sec_node1, sec_node2))
