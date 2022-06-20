# coordinates.py

import logging
from dataclasses import dataclass
from subprocess import PIPE, Popen
from typing import Literal

from exceptions import ErrorGetCoordinates
from settings import ROUND_COORDS

logger = logging.getLogger(__name__)


@dataclass
class Coordinates:
    # ширина
    latitude: float
    # долгота
    longitude: float


def get_gps_coordinates() -> Coordinates:
    """
        Функция возвращает координаты системы
        Возвращается именованный кортеж с шириной и долготой
    """
    coordinates = _get_geo_coordinates()
    return _round_coordinates(coordinates)


def _get_geo_coordinates() -> Coordinates:
    """Внутренняя функция получения координат"""
    geo_output = _get_geo_output()
    coordinates = _parse_coordinates(geo_output)
    return coordinates


def _get_geo_output() -> bytes:
    """
        Вызов программы получения координат
        Возвращается строка с байтами программы get_geo.py
    """
    process = Popen(["get_geo.py"], shell=True, stdout=PIPE)
    (output, error) = process.communicate()
    exit_code = process.wait()
    if error is not None or exit_code != 0:
        # logger.critical(f'Error get coordinates: error={error}; error_code={exit_code}')
        logger.critical(
            f"Error get coordinates: error={str(error)}; error_code={exit_code}"
        )
        raise ErrorGetCoordinates
    return output


def _parse_coordinates(geo_output: bytes) -> Coordinates:
    try:
        # Декодируем входящие данные
        # Если во время декода произошла ошибка, вызываем исключение
        # Удаляем пробелы с начала и с конца строки
        # Приводим к нижнему регистру
        # Разбиваем строку на несколько
        # Получаем список строк
        output = geo_output.decode().strip().lower().split("\n")
    except UnicodeDecodeError as e:
        logger.critical(f"Error decode coordinates: error=[{e}]")
        raise ErrorGetCoordinates
    return Coordinates(
        latitude=_parse_coord(output, "latitude"),
        longitude=_parse_coord(output, "longitude"),
    )


def _parse_coord(
    output: list[str], coord_type: Literal["latitude"] | Literal["longitude"]
) -> float:
    """
        Функция выборки строки с координатам из входящего списка
        Тип может быть либо latitude либо longitude
    """
    for line in output:
        if line.startswith(f"{coord_type}"):
            return _parse_float_coordinate(line.split()[1])
    else:
        logger.critical(f"Error get latitude and longitude output=[{output}]")
        raise ErrorGetCoordinates


def _parse_float_coordinate(value: str) -> float:
    """Приведение строки к типу float и обработка ошибки"""
    try:
        return float(value)
    except ValueError:
        logger.critical(f"Error convert string to float: value=[{value}]")
        raise ErrorGetCoordinates


def _round_coordinates(coondinates: Coordinates) -> Coordinates:
    """Округление полученных координат до ROUND_COORDS переменной"""
    # Проверяем определена ли переменная ROUND_COORDS
    if ROUND_COORDS is None:
        return coondinates
    # Если да, то округляем latitude и longitude до ROUND_COORDS знаков
    return Coordinates(
        *(round(c, ROUND_COORDS) for c in [coondinates.latitude, coondinates.longitude])
    )


if __name__ == "__main__":
    result = get_gps_coordinates()
    print(result)
    """
    Coordinates(latitude=55.7858, longitude=37.6256)
    """
