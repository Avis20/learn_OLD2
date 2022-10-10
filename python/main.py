from typing import Union


class Node:
    def __init__(self, data):
        self.next = None
        self.data = data

    def __repr__(self):
        return self.data


class LinkedList:
    def __init__(self, nodes: Union[None, list] = None):
        self.head = None
        nodes = [] if nodes is None else nodes
        if nodes:
            # Первый эл. связ. списка = первый переданный эл.
            node = Node(data=nodes.pop(0))
            self.head = node
            for elem in nodes:
                # след. эл. списка = новый объект ноды
                node.next = Node(data=elem)
                node = node.next

    def __repr__(self):
        # Первая нода = основание
        node = self.head
        # Временная переменная для вывода
        nodes = []
        # при простом вызове "node" вызывается repr у класса Node который возвращает data
        while node is not None:
            # Пока есть data добавляем объекты во временную переменную
            nodes.append(f"'{node.data}'")
            # Берем след. элемент - получаем атрибут след. эл
            node = node.next
        # Данные последнего эл. = None
        nodes.append("None")
        return " -> ".join(nodes)

    def __iter__(self):
        node = self.head
        # Пока есть нода, возвращаем ее и берем след.
        while node is not None:
            yield node
            node = node.next

    def add_first(self, node):
        # Связываем след. эл. переданной ноды с первым эл. связанного списка
        node.next = self.head
        # Делаем первый эл. ноды - переданный эл.
        self.head = node

    def add_last(self, node):
        # Если список пустой - добавим в начало списка
        if self.head is None:
            self.head = node
            return
        # Для вставки в конец списка необходимо пройти весь список
        for curr_node in self:
            pass
        # Укажем последнему эл. ссылку на новый эл.
        curr_node.next = node

    def add_after(self, target_node_data, new_node):
        # Нельзя вставить перед эл. если список пуст
        if self.head is None:
            raise Exception("List is empty")
        
        for node in self:
            # Если нашли эл. с данными
            if node.data == target_node_data:
                # след. эл. нового эл. = тот что был у эл. который нашли
                new_node.next = node.next
                node.next = new_node
                return
        raise Exception(f"Node with data '{target_node_data}' not found")

    def add_before(self, target_node_data, new_node):
        if self.head is None:
            raise Exception("List is empty")

        if self.head.data == target_node_data:
            # Если нужно вставить перед началом списка
            new_node.next = self.head
            self.head = new_node

        prev_node = self.head
        for node in self:
            if node.data == target_node_data:
                # След. эл. у нового эл. == найденный
                new_node.next = node
                # Пред. эл. при этом теперь ссылается на новый эл.
                prev_node.next = new_node
            prev_node = node


if __name__ == "__main__":
    llist = LinkedList(["a", "b"])
    print(llist)
    # >>> 'a' -> 'b' -> 'c' -> 'd' -> 'e' -> 'f' -> None
    new_node = Node("test")
    llist.add_before("b", new_node)
    print(llist)
    