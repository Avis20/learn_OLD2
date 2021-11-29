
from decor_dump import dump


@dump
def double(*args, **kwargs):
    "Double everyone"
    result_list = [item * 2 for item in args]
    result_dict = {key: val * 2 for key, val in kwargs.items()}
    return result_list, result_dict

if __name__ == '__main__':
    res = double(2, 3, 5, test=10, hello='3')
