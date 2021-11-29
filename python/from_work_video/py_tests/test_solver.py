from unittest import TestCase
from pytest import mark
from solver import Solver, mul


@mark.parametrize("values, expected", [
    ((2, 3), 6),
    ((3, 3), 9),
    ((1, 0), 0),
])
def test_mul(values, expected):
    res = mul(*values)
    assert res == expected


class TestSolver(TestCase):
    def test_add(self):
        res = Solver.add(2, 3)
        return self.assertEqual(res, 5)
