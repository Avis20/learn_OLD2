from typing import Callable


def my_sum(a: int, b: int) -> int:
    return a + b


def process_op(operation: Callable[[int, int], int], a: int, b: int) -> int:
    """Вызов функции и передача параметров

    Args:
        operation (Callable[[int, int], int]): Описание функции. [int, int] - входящие параметры. int - возвращаемые
        a (int): входящий параметр a
        b (int): входящий параметр b

    Returns:
        int: Результат вызова функции
    """
    return operation(a, b)


print(process_op(my_sum, 1, 2))
