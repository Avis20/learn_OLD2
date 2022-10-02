# weather_api_services.py

import logging
import json
from json import JSONDecodeError
from typing import Literal
from urllib import request
from urllib.error import URLError
from enum import Enum
from datetime import datetime
from dataclasses import dataclass

from coordinates import Coordinates
from exceptions import ErrorAPIService
import settings

logger = logging.getLogger(__name__)


class WeatherType(Enum):
    THUNDERSTORM = "Гроза"
    DRIZZLE = "Изморозь"
    RAIN = "Дождь"
    FOG = "Туман"
    CLEAR = "Ясно"
    SNOW = "Снег"
    CLOUDS = "Облачно"
    MIST = "Туман"

WeatherType.name('THUNDERSTORM')


# Список кодов и типов погоды
# https://openweathermap.org/weather-conditions
openweather_types: dict = {
    "200": WeatherType.THUNDERSTORM,
    "300": WeatherType.DRIZZLE,
    "500": WeatherType.RAIN,
    "600": WeatherType.SNOW,
    "741": WeatherType.FOG,
    "701": WeatherType.MIST,
    "800": WeatherType.CLEAR,
    "801": WeatherType.CLOUDS,
    "802": WeatherType.CLOUDS,
    "803": WeatherType.CLOUDS,
    "804": WeatherType.CLOUDS,
}

# Алиас для типа Celsius
# Если надо будет поменять на другой тип, то меняется в одном месте
Celsius = float


@dataclass
class Weather:
    # температура
    temperature: Celsius
    # тип погоды
    weather_type: WeatherType
    # восход
    sunrise: datetime
    # закат
    sunset: datetime
    # город
    city: str


def get_weather(coordinates: Coordinates) -> Weather:
    """Принимает координаты, возвращает объект погоды"""
    openweather_response = _get_openweather_response(
        longitude=coordinates.longitude, latitude=coordinates.latitude
    )
    weather = _parse_openweather_response(openweather_response)
    return weather


def _get_openweather_response(longitude: float, latitude: float) -> str:
    """Функция отправки запроса, получения ответа и его декодирование"""
    url = settings.OPENWEATHER_URL_TEMPLATE.format(
        longitude=longitude, latitude=latitude
    )
    response = None
    try:
        response = request.urlopen(url)
        # get_content_charset() - достает из заголовков кодировку в которой прислали ответ
        # по умолчанию utf-8
        contest = response.read().decode(response.headers.get_content_charset())
    except URLError:
        logger.critical(f"Error get response from: {url}; response=[{response}]")
        raise ErrorAPIService
    return contest


def _parse_openweather_response(openweather_response: str) -> Weather:
    """Преобразование ответа от openweather и формирование словаря"""
    try:
        openweather_dict = json.loads(openweather_response)
    except JSONDecodeError:
        logger.critical(f"Error decode json! get=[{openweather_response}]")
        raise ErrorAPIService
    return Weather(
        temperature=_parse_temperature(openweather_dict),
        weather_type=_parse_weather_type(openweather_dict),
        sunrise=_parse_suntime(openweather_dict, "sunrise"),
        sunset=_parse_suntime(openweather_dict, "sunset"),
        city=_parse_city(openweather_dict),
    )


def _parse_city(openweather_dict: dict) -> str:
    """Получение города из словаря"""
    return openweather_dict.get("name", "Moscow")


def _parse_suntime(
    openweather_dict: dict, sun_type: Literal["sunrise"] | Literal["sunset"]
) -> datetime:
    """Получение времени захода и восхода солнца из словаря"""
    try:
        time = int(openweather_dict.get("sys", {}).get(sun_type, 0))
    except (KeyError, ValueError):
        raise ErrorAPIService
    return datetime.fromtimestamp(time)


def _parse_weather_type(openweather_dict: dict) -> WeatherType:
    """Получение типа погоды из словаря"""
    try:
        weather_type = openweather_dict.get("weather", [])[0]
        weather_type_desc, weather_type_alias = (
            weather_type.get("description"),
            weather_type.get("main"),
        )
        weather_type_id = str(weather_type.get("id", "0"))
    except (IndexError, KeyError):
        logger.error("Can't get weather type")
        raise ErrorAPIService

    for _id, _weather_type in openweather_types.items():
        if weather_type_id.startswith(_id):
            return _weather_type
    else:
        logger.error(
            f"Unknown weather type! id={weather_type_id}; desc={weather_type_desc}, alias={weather_type_alias}"
        )
        raise ErrorAPIService


def _parse_temperature(openweather_dict: dict) -> Celsius:
    """Получение температуры из словаря"""
    return Celsius(openweather_dict.get("main", {}).get("temp", 0))


if __name__ == "__main__":
    result = get_weather(Coordinates(55.790426, 37.589814))
    print(result)
    """
    Weather(
        temperature=19.01,
        weather_type=<WeatherType.CLEAR: 'Ясно'>,
        sunrise=datetime.datetime(2022, 6, 13, 3, 44, 16),
        sunset=datetime.datetime(2022, 6, 13, 21, 15, 18),
        city='Лианозово'
    )
    """
