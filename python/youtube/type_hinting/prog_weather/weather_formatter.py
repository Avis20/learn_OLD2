# weather_formatter.py
from weather_api_services import Weather


def format_weather(weather: Weather) -> str:
    print(weather)
    return "Возвращает данные для печати погоды из структуры weather"
