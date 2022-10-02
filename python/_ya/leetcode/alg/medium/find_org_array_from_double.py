
# Medium

from typing import List
from collections import Counter

class Solution:
    def findOriginalArray(self, changed: List[int]) -> List[int]:
        counter, original = Counter(changed), list()
        for num in sorted(changed, key=lambda x: abs(x)):
            if counter[num] == 0:
                continue
            if counter[num*2] == 0:
                return []
            if num == 0 and counter[num] <= 1:
                return []
            original += [num]
            counter[num] -= 1
            counter[num*2] -= 1
        print("counter", counter)
        return original



if __name__ == "__main__":
    """
        Некий оригинальный массив (original) был преобразован в дублирующий массив (changed)
        путем умножения каждого эл. на 2 из оригинального, затем перемешан
        Дано: измененный массив (changed)
        Необходимо: Вернуть оригинальный массив (original) из дублирующего (changed)
        Примечание1: Если измененный массив (changed) не дублирующий, вернуть пустой массив
        Примечание2: Оригинальный массив можно вернуть в любом порядке
    """
    solution = Solution()
    # print(solution.findOriginalArray([1,3,4,2,6,8])) # [1,3,4]
    print(solution.findOriginalArray([2,1])) # [1]
    # print(solution.findOriginalArray([8,6,2,4,3,1])) # [1,3,4]
    # print(solution.findOriginalArray([0,0,0,0])) # [0,0]
    # print(solution.findOriginalArray([2,4]))
    # print(solution.findOriginalArray([6,3,0,1]))
    # print(solution.findOriginalArray([])) # []
    # print(solution.findOriginalArray([0])) # []
