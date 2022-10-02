

class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]


if __name__ == "__main__":
    """
        Ссылка:
        Дано:
        Необходимо:
        Примечание:
    """
    solution = Solution()
    # print(solution.twoSum([2, 7, 11, 15], 9))
    print(solution.twoSum(list(range(1, 10000)), 19999))