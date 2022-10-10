roman_to_int = {
    "I": {"value": 1},
    "V": {"value": 5, "prev_elem": "I"},
    "X": {"value": 10, "prev_elem": "I"},
    "L": {"value": 50, "prev_elem": "X"},
    "C": {"value": 100, "prev_elem": "X"},
    "D": {"value": 500, "prev_elem": "C"},
    "M": {"value": 1000, "prev_elem": "C"},
}


class Solution:
    def romanToInt(self, roman_number: str) -> int:
        result = 0
        prev_char = ""
        for char in roman_number:
            # Получим элемент из числовое значение из словаря
            elem: dict = roman_to_int.get(char, {})
            value: int = elem.get("value", 0)
            print("[DEBUG]", "char", char, "value", value)

            # Получим какое должно быть значение на замену. Может быть только 1 эл.
            prev_elem = elem.get("prev_elem", "")
            # Если эл. на замену есть и он равен реальному предыдущему, то посчитаем разницу
            if prev_elem and prev_elem == prev_char:
                # Получим знач. пред. эл.
                prev_value = roman_to_int.get(prev_elem, {}).get("value", 0)
                # Посчитаем разницу с пред. эл. Пример: IV
                # 1 уже записали, 5 в value = 5 - 1 * 2
                value = value - prev_value * 2

            print("[DEBUG]", "res value", value)
            result += value
            prev_char = char
        return result


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
    for variant in ["CM", "MCMXCIV", "LVIII"]:
        print(solution.romanToInt(variant))