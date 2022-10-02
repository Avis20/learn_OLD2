

roman_to_int = {
    "I": { "value": 1 },
    "V": { "value": 5, "prev_val": "I" },
}



class Solution:
    def romanToInt(self, roman_number: str) -> int:
        result = 0
        for char in roman_number:
            elem: dict = roman_to_int.get(char, {})
            val: int = elem.get("value", 0)
            if item := elem.get("prev_val"):
                res = val - roman_to_int.get(item, {}).get("value")
                print(res)
                result += res
            else:
                result += val
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
    # "III", "VI", 
    for variant in ["IV"]:
        print(solution.romanToInt(variant))
