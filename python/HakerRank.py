
"""
from collections import namedtuple


def calc_avg(nrows = 1, fields=[]):
    Student = namedtuple('students', ",".join(fields))
    students = []
    input_data = [['1', '97', 'Raymond', '7'], ['2', '50', 'Steven', '4']]
    for nrow in range(nrows):
        data = input_data.pop()
        # data = input().split()
        students.append(Student(*data))
    sum_marks = sum(int(s.MARKS) for s in students)
    return '{:.2f}'.format(sum_marks / len(students))


if __name__ == '__main__':
    # nrow = int(input())
    # fields = input().split()
    nrow = 2
    fields = ['ID', 'MARKS', 'NAME', 'CLASS']
    print(calc_avg(nrow, fields))
"""

"""
def average(some_list):
    uniq_list = set(some_list)
    return '{:.3f}'.format(sum(uniq_list) / len(uniq_list))


if __name__ == '__main__':
    # size = int(input())
    # arr = map(int, input().split())
    arr = [161, 182, 161, 154, 176, 170, 167, 171, 170, 174]
    result = average(arr)
    print(result)
"""

'''
"""
https://www.hackerrank.com/challenges/itertools-permutations
"""

from itertools import permutations

if __name__ == '__main__':
    string, count = input().split()
    list_items = list(permutations(string, int(count)))
    for word in sorted(list_items):
        print("".join(word))

'''

'''
"""
https://www.hackerrank.com/challenges/collections-counter/problem

"""

from collections import Counter

if __name__ == '__main__':
    n_shoes = input()
    shoes_list = Counter(map(int, input().split()))
    n_cust = int(input())
    amount = 0
    for _ in range(n_cust):
        size, price = map(int, input().split())
        if shoes_list[size]:
            amount += price
            shoes_list[size] -= 1
    print(amount)

'''

'''

"""
https://www.hackerrank.com/challenges/alphabet-rangoli/problem
"""

import string


def print_rangoli(size):
    alph = string.ascii_lowercase
    middle = size * 2 - 2
    for row in range(0, middle):
        print(row, end='')
 
    # for row in range(0, (size * 2) - 1):
    #     for col in range(0, size * 3):
    #         print(col, end='')
    #     print(' == ', row)

    # for index in reversed(range(0, size)):
    #     print(alph[index], '-', end='', sep='')
    # for index in range(1, size):
    #     print(alph[index], '-', end='', sep='')


if __name__ == '__main__':
    # n = int(input())
    n = 3
    print_rangoli(n)

'''

"""
# https://www.hackerrank.com/challenges/itertools-product/problem
"""

'''
from itertools import product

# Мое решение
if __name__ == '__main__':
    # my_list1 = input().split()
    # my_list2 = input().split()
    my_list1, my_list2 = [1,2], [3,4]
    rr = []
    for i in product(my_list1, my_list2):
        rr.append(tuple(map(int, i)))
    print(*rr)
'''

'''
# Не мое решение

if __name__ == '__main__':
    my_list1 = map(int, input().split())
    my_list2 = map(int, input().split())
    print(*product(my_list1, my_list2))

'''

"""
https://www.hackerrank.com/challenges/capitalize/problem

"""
'''
def solve(s):
    result = ""
    first = 1
    for letter in s:
        if letter.isalpha():
            if first:
                letter = letter.capitalize()
                first = 0
        elif letter.isdigit():
            first = 0
        else:
            first = 1
        result += letter
    return result


if __name__ == '__main__':
    print(solve("hello   word"))

'''

"""
# https://www.hackerrank.com/challenges/python-string-formatting/problem
'''
Given an integer, , print the following values for each integer  from  to :

Decimal
Octal
Hexadecimal (capitalized)
Binary
Function Description

Complete the print_formatted function in the editor below.

print_formatted has the following parameters:

int number: the maximum value to print
'''


def print_formatted(number):
    delim = len(bin(number)[2:])
    for i in range(1, number + 1):
        print(f"{i:>{delim}d} {i:>{delim}o} {i:>{delim}X} {i:>{delim}b}")


if __name__ == '__main__':
    print_formatted(17)

"""



"""

'''
https://www.hackerrank.com/challenges/designer-door-mat/problem
'''

if __name__ == '__main__':
    n, m = map(int, input().split())
    for i in range(1, (n // 2) * 2, 2):
        print(('.|.'*i).center(m, '-'))

    print('WELCOME'.center(m, '-'))
    for i in range((n // 2) * 2 - 1, 0, -2):
        print(('.|.'*i).center(m, '-'))

"""

'''
"""
https://www.hackerrank.com/challenges/text-wrap/problem
"""

import textwrap


def wrap(string, max_width):
    return "\n".join(textwrap.wrap(string, width=max_width))

if __name__ == '__main__':
    # string, max_width = input(), int(input())
    string, max_width = ('ABCDEFGHIJKLIMNOQRSTUVWXYZ', 4)
    result = wrap(string, max_width)
    print(result)
'''

'''
"""
https://www.hackerrank.com/challenges/text-alignment/problem
"""

# Replace all ______ with rjust, ljust or center.

# This must be an odd number
thickness = int(input())
thickness = 3
c = 'H'

# Top Cone
for i in range(thickness):
    print((c*i).rjust(thickness-1) + c + (c*i).ljust(thickness-1))

# Top Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2) +
          (c*thickness).center(thickness*6))

# Middle Belt
for i in range((thickness+1)//2):
    print((c*thickness*5).center(thickness*6))

# Bottom Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2) +
          (c*thickness).center(thickness*6))

# Bottom Cone
for i in range(thickness):
    print(((c * (thickness-i-1)).rjust(thickness) + c +
           (c * (thickness-i-1)).ljust(thickness)).rjust(thickness*6))

'''


'''

"""
You are given a string .
Your task is to find out if the string  contains:
alphanumeric characters, alphabetical characters, digits,
lowercase and uppercase characters.
"""

"""
Гораздо проще воспользоваться встроенной функцией any
"""
if __name__ == '__main__':
    # s = input()
    s = 'qA2'
    print(any(c.isalnum() for c in s))
    print(any(c.isalpha() for c in s))
    print(any(c.isdigit() for c in s))
    print(any(c.islower() for c in s))
    print(any(c.isupper() for c in s))


"""
Оно работает, и все тесткейсы прошли, но выглядит не очень..
"""
# My
if __name__ == '__main__':
    # s = input()
    s = 'qA2'
    # s = "#$%@^&*kjnk svskjnbui h 4oi3hheuh /dfh uidshvhdsuihv suihc 0hrem89m4c02mw4xo;,wh fwhncoishmxlxfkjsahnxu83v 08 n8OHOIHIOMOICWHOFCMHEOFMCOEJMC0J09C 03J J3L;JMFC3JM3JC3'JIOO9MMJ099U N090N9 OOHOLNHNLLKNLKNKNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333000000000000000000000000000000000000000000000000000000000000000000000000000"
    # print(True if s.isalnum() else False)
    for w in s:
        if w.isalnum():
            print(True)
            break
    else:
        print(False)

    for w in s:
        if w.isalpha():
            print(True)
            break
    else:
        print(False)

    for w in s:
        if w.isdigit():
            print(True)
            break
    else:
        print(False)

    for w in s:
        if w.islower():
            print(True)
            break
    else:
        print(False)

    for w in s:
        if w.isupper():
            print(True)
            break
    else:
        print(False)

'''

'''

def count_substring(string, sub_string):
    count = 0
    for i in range(len(string)):
        if string[i:].startswith(sub_string):
            count += 1
    return count


if __name__ == '__main__':
    str_ = "ABCDCDC"
    sub_str = 'CDC'
    result_str = count_substring(str_, sub_str)
    print(result_str)
'''

'''
def mutate_string(string, position, character):
    l = list(string)
    try:
        l[position] = character
    except IndexError:
        l
    return "".join(l)

if __name__ == '__main__':
    str_ = 'hello'
    result_str = mutate_string(str_, 100, 'o')
    print(result_str)
'''

'''
def split_and_join(line):
    return "-".join(line.split(" "))

if __name__ == '__main__':
    str_ = 'HackerRank.com presents "Pythonist 2".'
    result_str = split_and_join(str_)
    print(result_str)

'''

'''
def swap_case(s):
    return s.swapcase()

if __name__ == '__main__':
    str_ = 'HackerRank.com presents "Pythonist 2".'
    result_str = swap_case(str_)
    print(result_str)
'''
