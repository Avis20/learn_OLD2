

def f(numbers):
    count = 0
    best = 0
    for n in numbers:
        if n > 0:
            count += 1
            best = max(best, count)
        else:
            count = 0
    return best


if __name__ == "__main__":
    """
        Задача: Дан бинарный вектор
        Необходимо найти определить максимальную длину из подряд идущих единиц в этом векторе
    """
    assert f([1,1,1,0,0,1,1]) == 3
    assert f([0,0,0,0]) == 0
    assert f([1,1,1,1]) == 4
    assert f([]) == 0
