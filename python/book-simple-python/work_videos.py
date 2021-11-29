#!/usr/bin/env python3
class BaseProduct:
    type_name = None

    def __init__(self, name, price):
        self.name = name
        self.price = price

    def __str__(self):
        return "{} ({})".format(self.name, self.price)

    def __add__(self, other):
        return BaseProduct('sum', self.price + other.price)

    def __repr__(self):
        return "{}('{}', {})".format(self.__class__.__name__, self.name, self.price)


class Phone(BaseProduct):
    type_name = 'телефон'


class NoteBook(BaseProduct):
    type_name = 'ноутбук'


class Basket:
    def __init__(self):
        self._items = []
        self.items_set = set()

    def __iadd__(self, other):
        self._items.append(other)
        self.items_set.add(other)
        return self

    @property
    def items(self):
        return self._items

    @items.setter
    def items(self, val):
        self.__iadd__(val)

    def __len__(self):
        return len(self._items)

    def __iter__(self):
        print('__iter__')
        return (i for i in self._items)

    def __contains__(self, item):
        print('__contains__')
        return item in self.items_set


product_1 = Phone('IPhone 12', 4000)
product_2 = NoteBook('Asus', 44000)
product_3 = NoteBook('Lenovo', 48000)
product_4 = NoteBook('test1', 50000)

basket = Basket()
basket += product_1
basket += product_2
basket += product_3

print("basket len=", len(basket))

for el in basket:
    print("--> ", el)

print(product_1 in basket)
basket.items = product_4
print(product_4 in basket)
