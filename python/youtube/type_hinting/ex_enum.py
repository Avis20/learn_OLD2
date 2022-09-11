

from enum import Enum


class WeatherType(Enum):
    THUNDERSTORM = "Гроза"
    RAIN = "Дождь"
    FOG = "Туман"
    CLEAR = "Ясно"


def what_todo(weather_type: WeatherType) -> None:
    print(weather_type.value)
    match weather_type:
        case WeatherType.THUNDERSTORM | WeatherType.RAIN:
            print("Лучше дома")
        case WeatherType.CLEAR:
            print("отличная погода")
        case _:
            print("Норм")
    print()

for wt in WeatherType:
    what_todo(wt)

# >>> Гроза
# >>> Лучше дома
# >>> 
# >>> Дождь
# >>> Лучше дома
# >>> 
# >>> Туман
# >>> Норм
# >>> 
# >>> Ясно
# >>> отличная погода

# >>> RAIN Дождь
# >>> FOG Туман

"""
from enum import Enum


class WeatherType(Enum):
    RAIN = "Дождь"
    FOG = "Туман"

print(
    WeatherType.FOG.name,
    WeatherType.FOG.value
)
# >>> FOG Туман

def print_weather_type(weather_type: WeatherType) -> None:
    print(isinstance(weather_type, WeatherType))
    print(weather_type.value)
    # >>> True
    # >>> WeatherType.RAIN

print_weather_type(WeatherType.RAIN)


class WeatherType2():
    RAIN = "Дождь"
    FOG = "Туман"

print(WeatherType2.FOG)
# >>> Туман

def print_weather_type2(weather_type: WeatherType2) -> None:
    print(isinstance(weather_type, WeatherType2))
    print(weather_type)
    # >>> False
    # >>> Дождь

print_weather_type2(WeatherType2.RAIN)
"""
