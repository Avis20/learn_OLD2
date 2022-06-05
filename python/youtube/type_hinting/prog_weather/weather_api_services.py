# weather_api_services.py
from enum import Enum
from datetime import datetime
from coordinates import Coordinates
from dataclasses import dataclass


class WeatherType(Enum):
    THUNDERSTORM = "Гроза"
    DRIZZLE = "Изморозь"
    RAIN = "Дождь"
    FOG = "Туман"
    CLEAR = "Ясно"
    SNOW = "Снег"


@dataclass
class Weather:
    # температура
    temperature: int
    # тип погоды
    weather_type: None
    # восход
    sunrise: datetime
    # закат
    sunset: datetime
    # город
    city: str


def get_weather(coordinates: Coordinates) -> Weather:
    """Принимает координаты, возвращает объект погоды"""
    return Weather(
        temperature=20,
        weather_type=WeatherType.CLEAR,
        sunset=datetime.fromisoformat("2022-06-05 23:19:03"),
        sunrise=datetime.fromisoformat("2022-06-05 23:19:03"),
        city="Moscow",
    )
