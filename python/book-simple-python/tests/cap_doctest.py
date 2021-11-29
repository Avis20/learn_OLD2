
import doctest
from string import capwords


def just_cap_text(text):
    """
    >>> just_cap_text('привет')
    'Привет'
    >>> just_cap_text('привет, как дела?')
    'Привет, Как Дела?'
    >>> just_cap_text("i'm the best of the best")
    "I'm The Best Of The Best"
    """
    return capwords(text)


if __name__ == "__main__":
    doctest.testmod()
