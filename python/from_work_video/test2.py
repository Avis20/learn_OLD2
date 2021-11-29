
def test():
    test.level = 1

    def test2():
        test.level += 1
        return test.level
    return test2

if __name__ == '__main__':
    var = test()
    print(var())
    print(var())

