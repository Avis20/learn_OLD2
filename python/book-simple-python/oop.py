#!/usr/bin/env python3
class BaseProduct:
    type_name = None

    def __init__(self, name, price):
        self.name = name
        self.price = price

    def __str__(self):
        return "{} ({})".format(self.name, self.price)

    def __add__(self, other):
        return BaseProduct('summ', self.price + other.price)

    def __repr__(self):
        return "{}('{}', {})".format(self.__class__.__name__, self.name, self.price)


class Phone(BaseProduct):
    type_name = 'телефон'


class NoteBook(BaseProduct):
    type_name = 'ноутбук'


class Basket:
    def __init__(self):
        self.items = []
        self.items_set = set()

    @property
    def total(self):
        return sum(el.price for el in self)

    def __iadd__(self, other):
        self.items.append(other)
        self.items_set.add(other)
        return self

    def __len__(self):
        return len(self.items)

    def __iter__(self):
        # print('__iter__')
        return (el for el in self.items)

    def __contains__(self, item):
        print('__contains__')
        return item in self.items_set

    def __getattribute__(self, item):
        print("__getattribute__ {}".format(item))
        return super().__getattribute__(item)

    def __getattr__(self, item):
        print("__getattr__ {}".format(item))
        # return "Тут никого нет!"
        return super().__getattr__(item)


product_1 = Phone('IPhone 12', 4000)
product_2 = NoteBook('Asus', 44000)
product_3 = NoteBook('Lenovo', 48000)

basket = Basket()
basket += product_1
basket += product_2
basket += product_3
# print(basket.items)

print(basket.total)
print(basket.total_found)
