#!/usr/bin/env python3
# main.py
import logging
from pathlib import Path

from coordinates import get_gps_coordinates
from weather_api_services import get_weather
from weather_formatter import format_weather
from exceptions import ErrorGetCoordinates, ErrorAPIService
from history import save_weather, PlainFileWeatherStorage, JSONFileWeatherStorage

logging.basicConfig(format="\n->>> %(levelname)s: %(message)s\n", level=logging.DEBUG)
logger = logging.getLogger(__name__)
logger.addHandler(logging.StreamHandler())


def main():
    try:
        coordinates = get_gps_coordinates()
    except ErrorGetCoordinates:
        logger.error("Не удалось получить GPS координаты")
        exit(1)
    try:
        weather = get_weather(coordinates)
    except ErrorAPIService:
        print(f"Не удалось получить погоду по координатам {coordinates}")
        exit(1)
    print(format_weather(weather))

    save_weather(
        weather,
        JSONFileWeatherStorage(Path.cwd() / "history.json")
        # PlainFileWeatherStorage(Path.cwd() / "history.txt")
    )


if __name__ == "__main__":
    main()
