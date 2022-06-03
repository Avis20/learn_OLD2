def plus_two(number: int) -> int:
    print("start func plus_two")
    return number + 2


print(plus_two(2))

# >>> start func plus_two
# >>> 4

# интерпретатор не проверяет типы входящих и возвращающих значений!
print(plus_two("2"))

# >>> start func plus_two
# >>> Traceback (most recent call last):
# >>>   File "/home/avis/develop/learn/python/youtube/type_hinting/main.py", line 11, in <module>
# >>>     print(plus_two("2"))
# >>>   File "/home/avis/develop/learn/python/youtube/type_hinting/main.py", line 3, in plus_two
# >>>     return number + 2
# >>> TypeError: can only concatenate str (not "int") to str