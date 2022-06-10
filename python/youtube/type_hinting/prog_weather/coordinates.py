# coordinates.py

from dataclasses import dataclass
from subprocess import PIPE, Popen
from exceptions import ErrorGetCoordinates


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
    # Запускаем подпроцесс с получением координат
    process = Popen(["get_geo.py"], shell=True, stdout=PIPE)
    (output, error) = process.communicate()
    exit_code = process.wait()
    # Проверяем ошибку и код с которым завершился процесс
    if error is not None or exit_code != 0:
        raise ErrorGetCoordinates
    # декодируем полученный результат т.к. процесс вернул байты
    # удаляем пробелы с начала и конца строки
    # приводим к нижнему регистру
    # разбиваем строку на несколько
    # Получаем список строк
    output_lines = output.decode().strip().lower().split("\n")
    latitude = longitude = None
    for line in output_lines:
        if line.startswith("latitude:"):
            # Если удалось найти строку которая начинается с latitude, то
            # разбиваем строку по пробелу и берем 2-й элемент. Приводим к float типу
            # Также для longitude
            latitude = float(line.split()[1])
        if line.startswith("longitude:"):
            longitude = float(line.split()[1])
    return Coordinates(latitude=latitude, longitude=longitude)


if __name__ == "__main__":
    print("\n\n")
    print(get_gps_coordinates())
    print("\n\n")
    # >>> Coordinates(latitude=55.7522, longitude=37.6156)
