
def test(a, my_list: list = []):
    my_list.append(a)
    print(my_list)


test(1)
test(2)
my_new_list = ['test']
test(3, my_new_list)
test(4)




"""
from enum import Enum

class WeatherType(Enum):
    THUNDERSTORM = "Гроза"
    DRIZZLE = "Изморозь"
    RAIN = "Дождь"
    FOG = "Туман"
    CLEAR = "Ясно"
    SNOW = "Снег"
    CLOUDS = "Облачно"
    MIST = "Туман"

test = "RAIN"
test2 = WeatherType(test)
"""