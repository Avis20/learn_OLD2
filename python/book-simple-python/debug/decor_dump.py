
def dump(func):
    "Вывод входящих и исходящих параметров"
    def wrapper(*args, **kwargs):
        print("Function name ", func.__name__)
        print("Input arguments: ", " ".join(map(str, args)))
        print("Input keywords arguments: ", kwargs.items())
        retult = func(*args, **kwargs)
        print("Retult ", retult)
        return retult
    return wrapper
