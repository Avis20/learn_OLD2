

strings = ['a', 'b', 'c']

for st in strings:
    st, strings[-1] = strings[-1], st

print(strings)
