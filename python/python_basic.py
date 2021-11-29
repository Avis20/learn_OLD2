
test = 1

if m := test:
    print(m)
    test = 2

print(test)


'''
if __name__ == '__main__':
    list1 = ['test1', 'test2', 'test3']
    first_el = list1.pop(0)
    print(first_el)
    print(list1)
'''


'''

Вернуть последний эл.
>>> list1 = [1,2,3]
>>> list1.pop()
3
>>> list1.pop(-1)
2


pop работает и со словарем но как-то по другому...
Например так можно поправить ключ у словаря

test_dict = {'test1': 132, 'test2': 789}
print(test_dict)
test_dict['test3'] = test_dict.pop('test1')
print(test_dict)

'''
