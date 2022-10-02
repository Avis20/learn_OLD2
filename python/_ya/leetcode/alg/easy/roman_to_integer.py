from enum import Enum


class RomanIntMap(Enum):
    I = 1
    V = 5
    X = 10
    L = 50
    C = 100
    D = 500
    M = 1000


replaced_romans = [
    ("IV", "IIII"),
    ("IX", "VIIII"),
    ("XL", "XXXX"),
    ("XC", "LXXXX"),
    ("CD", "CCCC"),
    ("CM", "DCCCC"),
]


class Solution:
    def romanToInt(self, roman_number: str) -> int:
        # Заменим все 6 кейсов строки в простые числа
        # т.е. Явно заменим число IV на IIII, а потом посчитаем согласно enum-у
        roman_number = self.replace_roman(roman_number)
        result = 0
        for char in roman_number:
            result += RomanIntMap[char].value
        return result

    def replace_roman(self, roman_str: str) -> str:
        for str_from, str_to in replaced_romans:
            roman_str = roman_str.replace(str_from, str_to)
        return roman_str


if __name__ == "__main__":
    """
    Ссылка: https://leetcode.com/problems/roman-to-integer/
    Дано: Строка содержащая римские цифры
    Необходимо: Преобразовать в целое число
    Примечание:
        1) Римские цифры представлены семью различными символами:
            I=1, V=5, X=10, L=50, C=100, D=500, M=1000
        2) Гарантируется что срока из римских цифр лежит в диапазоне от 1..3999
    """
    solution = Solution()
    # "CM", "MCMXCIV", "LVIII"
    for variant in ["IV", "IX"]:
        print(solution.romanToInt(variant))
