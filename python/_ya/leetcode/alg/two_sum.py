
from typing import List

class Solution:
    def twoSum(self, nums: List[int], target: int):
        """
            Долго...
        """
        i, j = 0, 1
        nums_len = len(nums)
        while i < nums_len:
            while j < nums_len:
                print("[DEBUG]", "i, j", i, j)
                if nums[i] + nums[j] == target: return [i, j]
                j += 1
            i += 1
            j = i + 1
        # while j <= nums_len:
        #     print("[DEBUG]", "a[i], a[j]", nums[i], nums[j])
        #     if nums[i] + nums[j] == target: return [i, j]
        #     i, j = i + 1, j + 1



if __name__ == "__main__":
    """
    """
    solution = Solution()
    print(solution.twoSum(range(1, 10000), 19999))
    print(solution.twoSum([3,2,3], 6)) # [0, 2]
    print(solution.twoSum([2,7,11,15], 9)) # [0, 1]
    print(solution.twoSum([3,2,4], 6)) # [1, 2]
