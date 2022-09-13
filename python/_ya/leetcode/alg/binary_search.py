

from typing import List


class Solution:
    def search(self, nums: List[int], target: int) -> int:
        """
            Сложность алгоритма = O(logN)T
            Как ее посчитали? хз...
        """
        # Начало всегда 0, конец = кол-во эл. - 1
        begin, end = 0, len(nums) - 1
        # Пока начало меньше конца идем по половинке
        # Если начало будет превышать конец, то мы уже вышли из массива
        # Как только найдем эл. выйдем из цикла
        while begin <= end:
            # Начало + конец // 2 = середина
            middle = (begin + end) // 2
            if nums[middle] == target: return middle
            # Если эл. больше того что нашли, то он с лева
            if nums[middle] < target:
                # Будем искать с середины до конца, уменьшим начало
                begin = middle + 1
            else:
                # Если меньше, то с права - уменьшим конец
                end = middle - 1
        return -1




if __name__ == "__main__":
    """
        Дан массив целых чисел (nums) отсортированный в порядке возрастания и дано число (target)
        Необходимо написать функцию которая ищет число в массиве
        Если число находиться в массиве, вернуть индекс. Иначе вернуть -1
    """
    solution = Solution()
    # print('\n\n')
    # print(solution.search([1,2,3,4,5,6,7,8,9,10], -1))
    # print('\n\n')
    assert solution.search([-1,0,3,5,9,12], 9) == 4
    assert solution.search([-1,0,3,5,9,12], 2) == -1
    very_big_number_list = range(-1*100000000, 1*100000000)
    assert solution.search(very_big_number_list, 99000999) == 199000999
