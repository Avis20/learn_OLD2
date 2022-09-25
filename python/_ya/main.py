class chain_sum(int):
    def __call__(self, num=0):
        return chain_sum(self + num)


print(1 + chain_sum(5))  # 6
print(1 + chain_sum(5)(2))  # 8
print(1 + chain_sum(5)(100)(-10))  # 96
