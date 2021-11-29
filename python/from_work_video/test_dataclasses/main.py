
def accept_params(foo, bar, baz):
    print(locals())


def accept_kwargs(**kwargs):
    print(locals())


if __name__ == '__main__':
    # Если передать как позиционные, то каждое значение попадет в каждую переменную
    accept_params('test1', 'test2', 'test3')
    # {'foo': 'test1', 'bar': 'test2', 'baz': 'test3'}

    # Явная передача каждой переменной
    accept_params(foo='test1', bar='test2', baz='test3')
    # {'foo': 'test1', 'bar': 'test2', 'baz': 'test3'}

    # функция принимает только словарь, нужно передовать словарь
    accept_kwargs(foo='test1', bar='test2', baz='test3')
    # {'kwargs': {'foo': 'test1', 'bar': 'test2', 'baz': 'test3'}}

    # Если передать списком, то непонятно с чем мачить - будет исключение
    # accept_kwargs('test1', 'test2', 'test3')
    # TypeError: accept_kwargs() takes 0 positional arguments but 3 were given

    data = dict(foo='test1', bar='test2', baz='test3')
    # Если передать только data, то будет передан только 1 позиционный аргумент - ожидается словарь
    # accept_kwargs(data)
    # TypeError: accept_kwargs() takes 0 positional arguments but 1 was given

    # Поэтому нужно раскрыть
    accept_kwargs(**data)
    # {'kwargs': {'foo': 'test1', 'bar': 'test2', 'baz': 'test3'}}
