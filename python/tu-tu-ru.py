
def is_palindrome(string):
    if len(string) < 1:
        return True
    if not string[0] == string[-1]:
        return False
    return is_palindrome(string[1:-1])


if __name__ == '__main__':
    print(is_palindrome('топот'))
    print(is_palindrome('машина'))
    print(is_palindrome('пf'))
    print(is_palindrome('пп'))
    print(is_palindrome('п'))
    print(is_palindrome(''))


'''
def trace(sep):
    trace.level = 0

    def decorator(func):
        def wrapper(n):
            print(f"{sep * trace.level} -> {func.__name__}({n})")
            trace.level += 1
            result = func(n)
            trace.level -= 1
            print(f"{sep * trace.level} <- {func.__name__}({n}) == {result}")
            return result
        return wrapper
    return decorator


@trace('___')
def fac(n):
    if n <= 0:
        return 1
    return n * fac(n - 1)


if __name__ == '__main__':
    print(fac(1.5))

'''

'''
def is_between(x, y, z):
    return x <= y <= z


if __name__ == '__main__':
    print(is_between(1, 2, 3))

'''

'''
import math


def distance(x1, y1, x2, y2):
    dx = x2 - x1
    dy = y2 - y1
    dsquared = dx**2 + dy**2
    result = math.sqrt(dsquared)
    return result


if __name__ == '__main__':
    print(distance(1, 2, 4, 6)f)
'''


'''

def check_x_y(x, y):
    if x > y:
        return 1
    elif x < y:
        return -1
    elif x == y:
        return 0


if __name__ == '__main__':
    print(check_x_y(1, 2))
'''