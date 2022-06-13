

TEST_TUPLE = (1, 2)
print(TEST_TUPLE)
print(type(TEST_TUPLE))
# >>> (1, 2)
# >>> <class 'tuple'>

TEST_TUPLE2 = (1)
print(TEST_TUPLE2)
print(type(TEST_TUPLE2))
# >>> 1
# >>> <class 'int'>

TEST_MULTISTRING = (
    "Hello "
    "World"
)
print(TEST_MULTISTRING)
print(type(TEST_MULTISTRING))
# >>> Hello World
# >>> <class 'str'>

# Но если сделать 2-й эл. пустым то будет tuple
TEST_TWO = 1,
print(TEST_TWO)
print(type(TEST_TWO))
# >>> (1,)
# >>> <class 'tuple'>
