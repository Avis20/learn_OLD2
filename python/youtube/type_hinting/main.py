
from typing import NamedTuple

class Employee(NamedTuple):
    name: str
    id: int = 3

employee = Employee("Guido")
assert employee.id == 3
