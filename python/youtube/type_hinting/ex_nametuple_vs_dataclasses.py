from dataclasses import dataclass
from typing import NamedTuple


class User(NamedTuple):
    username: str


user = User("test")
print(user.username)
# >>> test
# user.username = "test2"

# >>>     user.username = "test2"
# >>> AttributeError: can't set attribute


@dataclass
class User2:
    username: str


user2 = User2("test2")
print(user2.username)
# >>> test2
user2.username = "test3"
print(user2.username)
# >>> test3
