

from typing import List


class Solution:
    def search(self, nums: List[int], target: int) -> int:
        
        length = len(nums)
        middle = length // 2
        middle_num = nums[middle]
        # print("[DEBUG]", "nums", nums, "target", target, "length", length, "middle", middle)
        # print("[DEBUG]", "middle_num", middle_num)

        if length == 1 and middle_num != target:
            return -1
        
        if middle_num == target:
            # print("FIND!!!", middle)
            return middle
        elif middle_num < target:
            # print("RIGHT!!! add middle", )
            result = self.search(nums[middle:length], target)
            return result if result == -1 else result + middle
        elif middle_num > target:
            return self.search(nums[0:middle], target)


if __name__ == "__main__":
    """
        Дан массив целых чисел (nums) отсортированный в порядке возрастания и дано число (target)
        Необходимо написать функцию которая ищет число в массиве
        Если число находиться в массиве, вернуть индекс. Иначе вернуть -1
    """
    solution = Solution()
    assert solution.search([-1,0,3,5,9,12], 9) == 4
    assert solution.search([-1,0,3,5,9,12], 2) == -1
    very_big_number_list = range(-1*100000000, 1*100000000)
    assert solution.search(very_big_number_list, 99000999) == 199000999
