

class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            return False

        numbers = list()
        while x > 0:
            x, num = divmod(x, 10)
            numbers.append(num)
        start, end = 0, len(numbers) - 1
        while start <= end:
            if numbers[start] != numbers[end]:
                return False
            start, end = start + 1, end - 1
        return True


if __name__ == "__main__":
    """
    Дано целое число x
    Вернуть true если x палиндром
    """
    solution = Solution()
    for n in [1234, 123, 121, 1, -121, 10]:
        print("number", n, "is palindrome", solution.isPalindrome(n))
