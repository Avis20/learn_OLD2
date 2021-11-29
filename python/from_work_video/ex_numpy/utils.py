from psutil import virtual_memory
from time import perf_counter


def time_prof(func):
    def wrapper(*args, **kwargs):
        start_time = perf_counter()
        result = func(*args, **kwargs)
        print(f'{perf_counter() - start_time:.6f}')
        return result
    return wrapper


def show_mem(mem):
    print(f'{(virtual_memory().used - mem ) / 2 ** 20:.3f}')
