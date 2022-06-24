# history.py

import json
from datetime import datetime
from pathlib import Path
from weather_api_services import Weather
from weather_formatter import dict_format_weather, format_weather


class WeatherStorage:
    """Интерфейс для различных хранилищ погоды"""

    def save(self, weather: Weather) -> None:
        raise NotImplementedError


def save_weather(weather: Weather, storage: WeatherStorage) -> None:
    """
    Функция сохранения погоды в хранилище
    Не важно какое будет хранилище (plain text, json, sql db, nosql db)
    Главное чтобы в унаследованном классе был метод save
    """
    storage.save(weather)


class PlainFileWeatherStorage(WeatherStorage):
    """Сохранение погоды в текстовый файл"""

    def __init__(self, file: Path):
        self._file = file

    def save(self, weather: Weather):
        now = datetime.now()
        weather_str = format_weather(weather)

        with open(self._file, "a") as file:
            file.write(f"{now}\n{weather_str}\n")


class JSONFileWeatherStorage(WeatherStorage):
    """Сохранение погоды в json файл"""

    def __init__(self, json_file: Path):
        self._json_file = json_file
        self._init_storage()

    def _init_storage(self) -> None:
        if not self._json_file.exists():
            self._json_file.write_text("[]")

    def save(self, weather: Weather) -> None:
        history = self._read_history()
        history.append({
            "date": str(datetime.now()),
            "weather": dict_format_weather(weather)
        })
        self._write_history(history)

    def _read_history(self) -> list:
        with open(self._json_file, "r") as file:
            return json.load(file)

    def _write_history(self, history) -> None:
        with open(self._json_file, "w") as file:
            file.write(json.dumps(history, indent=2, default=str, ensure_ascii=False))
