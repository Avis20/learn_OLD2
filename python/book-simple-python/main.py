
from decor_dump import dump
from timeit import timeit


# @dump
def make_list1(*args, **kwargs):
    result = []
    for i in range(10):
        result.append(i)
    return result


# @dump
def make_list2():
    return [i for i in range(10)]


print('make_list1 ', timeit(make_list1, number=100000), " seconds\n")
print('make_list2 ', timeit(make_list2, number=100000), " seconds\n")


"""
n3 ./main.py
Function name  make_list1
Input arguments:
Input keywords arguments:  dict_items([])
Retult  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
make_list1  4.144100012126728e-05  seconds

Function name  make_list2
Input arguments:
Input keywords arguments:  dict_items([])
Retult  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
make_list2  2.4430999928881647e-05  seconds
"""


'''
from timeit import repeat
print(repeat("num = 5; num *= 500", repeat=5))
'''


''' timeit
from timeit import timeit
print(timeit("num = 5; num *= 500"))
'''

'''
N = 1

array = []
for i in range(N):
    # params = str(input()).split(' ')
    params = ['insert', '0', '1']
    command = params[0]
    del params[0]
    map(int, params)

    if command == 'insert':
        array.insert(int(params[0]), params[1])
    elif 'print' == command:
        print(array)
    elif 'remove' == command:
        array.remove(params[0])
    elif command == 'append':
        array.append(params[0])
    elif command == 'sort':
        array.sort()
    elif command == 'pop':
        array.pop()
    elif command == 'pop':
        array.pop()
'''
