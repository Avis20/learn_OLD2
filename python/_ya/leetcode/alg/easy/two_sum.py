from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int):
        """
        nums = (x1, x2, x3, ... xn)
        xa + xb = target
        xa = target - xb
        """
        # В буфер будем записывать элементы по которым не удалось найти пары
        buffer_dict = {}
        for i, num in enumerate(nums):
            # x + num = target <=> x = target - num
            x = target - num
            if x in buffer_dict:
                # Нашли элемент, вернем индекс
                return [buffer_dict[x], i]
            else:
                # Иначе запишем эл. и индекс, чтобы потом найти ему такое число
                # что при x + num = target
                buffer_dict[num] = i


if __name__ == "__main__":
    """
    Дан: массив целых чисел (nums) и дано целое число (target)
    Необходимо: вернуть 2 индекса сумма эл. которого == target
    Примечание: каждый эл. массива уникален и 100% есть такая пара
    """
    solution = Solution()
    print(solution.twoSum(range(1, 100000), 19999))  # [9998, 9999]
    print(solution.twoSum([3, 2, 3], 6))  # [0, 2]
    print(solution.twoSum([2, 7, 11, 15], 9))  # [0, 1]
    print(solution.twoSum([3, 2, 4], 6))  # [1, 2]
