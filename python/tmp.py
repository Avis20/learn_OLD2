from typing import Union


class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next


class LinkedList:
    def __init__(self, nodes: Union[list, None] = None):
        self.head = None
        nodes = [] if nodes is None else nodes
        if nodes:
            node = Node(nodes.pop(0))
            self.head = node
            for elem in nodes:
                node.next = Node(elem)
                node = node.next

    def __iter__(self) -> Node:
        node = self.head
        while node is not None:
            yield node
            node = node.next

    def __repr__(self):
        nodes = [str(n.data) for n in self]
        return f"[{','.join(nodes)}]"

    def add_after(self, target_node_data, new_node):
        for node in self:
            if target_node_data:
                new_node.next = node.next
                node.next = new_node
                return

    def add_first(self, node):
        node.next = self.head
        self.head = node

    def add_before(self, target_node_data, new_node):
        if self.head.data == target_node_data:
            new_node.next = self.head
            self.head = new_node

        prev_node = self.head
        for node in self:
            if node.data == target_node_data:
                new_node.next = node
                prev_node.next = new_node
                return
            prev_node = node


class Solution:
    def mergeTwoLists(self, llist1: LinkedList, llist2: LinkedList):
        result_llist = LinkedList()
        for i in llist1:
            for j in llist2:
                if i.data > j.data:
                    print("add_before")
                    print(i.data, j.data)
                    llist1.add_before(i.data, j)
                else:
                    print("add_after")
                    print(i.data, j.data)
                    llist1.add_after(i.data, j)
                break
            break
                #     result_llist.add_first(i)
                # else:
                #     result_llist.add_last()

        return llist1


if __name__ == "__main__":
    """
    Ссылка: https://leetcode.com/problems/merge-two-sorted-lists/
    Дано: Даны 2 head ссылки на 2 отстортированных односвязанных списка
    Необходимо: Соединить 2 связанных списка в 1 отсортированный список
    Примечание:
    """
    # llist1 = LinkedList([1, 2, 4])
    # llist2 = LinkedList([1, 3, 4])
    # solution = Solution()
    # print(solution.mergeTwoLists(llist1, llist2))

    llist1 = LinkedList([1, 3, 5])
    llist2 = LinkedList([4])
    solution = Solution()
    print(solution.mergeTwoLists(llist1, llist2))
