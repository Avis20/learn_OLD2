# coordinates.py

from dataclasses import dataclass


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
    return Coordinates(latitude=10, longitude=20)
