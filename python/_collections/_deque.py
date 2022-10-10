
from collections import deque

history = deque()
print("history =", history)
# >>> queue = deque([])

# Добавляем в начало
history.appendleft("https://leetcode.com/")
history.appendleft("https://leetcode.com/problems/")
history.appendleft("https://leetcode.com/problems/merge-two-sorted-lists/")
print(history)

for i in range(len(history)):
    page = history.popleft()
    print("page =", page)

# >>> page = https://leetcode.com/problems/merge-two-sorted-lists/
# >>> page = https://leetcode.com/problems/
# >>> page = https://leetcode.com/
