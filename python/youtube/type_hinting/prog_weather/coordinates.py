# coordinates.py

from dataclasses import dataclass
from subprocess import PIPE, Popen
from typing import Literal
from exceptions import ErrorGetCoordinates
from settings import USE_ROUND_COORDS


@dataclass
class Coordinates:
    # ширина
    latitude: float
    # долгота
    longitude: float


def get_gps_coordinates() -> Coordinates:
    """Функция возвращает координаты системы
    Возвращается именованный кортеж с шириной и долготой
    """
    coordinates = _get_geo_coordinates()
    return _round_coordinates(coordinates)


def _get_geo_coordinates() -> Coordinates:
    geo_output = _get_geo_output()
    coordinates = _parse_coordinates(geo_output)
    return coordinates


def _get_geo_output() -> bytes:
    process = Popen(["get_geo.py"], shell=True, stdout=PIPE)
    (output, error) = process.communicate()
    exit_code = process.wait()
    if error is not None or exit_code != 0:
        raise ErrorGetCoordinates
    return output


def _parse_coordinates(geo_output: bytes) -> Coordinates:
    try:
        output = geo_output.decode().strip().lower().split("\n")
    except UnicodeDecodeError:
        raise ErrorGetCoordinates
    return Coordinates(
        latitude=_parse_coord(output, "latitude"),
        longitude=_parse_coord(output, "longitude"),
    )


def _parse_coord(
    output: list[str], coord_type: Literal["latitude"] | Literal["longitude"]
) -> float:
    for line in output:
        if line.startswith(f"{coord_type}"):
            return _parse_float_coordinate(line.split()[1])
    else:
        raise ErrorGetCoordinates


def _parse_float_coordinate(value: str) -> float:
    try:
        return float(value)
    except ValueError:
        raise ErrorGetCoordinates


def _round_coordinates(coondinates: Coordinates) -> Coordinates:
    if not USE_ROUND_COORDS:
        return coondinates
    return Coordinates(
        *map(lambda c: round(c, 1), [coondinates.latitude, coondinates.longitude])
    )


if __name__ == "__main__":
    print("\n\n")
    print(get_gps_coordinates())
    print("\n\n")
    # >>> Coordinates(latitude=55.7522, longitude=37.6156)
