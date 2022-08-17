from itertools import permutations

if __name__ == '__main__':
    list_numbers = [1, 2, 3]
    print("permutations", list(permutations(list_numbers))) 
    # >>> permutations [(1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1)]
