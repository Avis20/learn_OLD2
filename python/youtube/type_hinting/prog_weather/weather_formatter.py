# weather_formatter.py
from weather_api_services import Weather


def format_weather(weather: Weather) -> str:
    """Возвращает данные для печати погоды из структуры weather"""
    return (
        f"{weather.city}, температура {weather.temperature}°C, "
        f"{weather.weather_type.value}\n"
        f"Восход: {weather.sunrise.strftime('%H:%S')}\n"
        f"Закат: {weather.sunset.strftime('%H:%S')}\n"
    )

def dict_format_weather(weather: Weather) -> dict:
    """Возвращает dict формат погоды из структуры Weather"""
    return {
        "temperature": f"{weather.temperature}°C",
        "weather_type": weather.weather_type.value,
        "sunrise": weather.sunrise,
        "sunset": weather.sunset,
        "city": weather.city,
    }


if __name__ == "__main__":
    from datetime import datetime
    from weather_api_services import WeatherType

    result = format_weather(
        Weather(
            temperature=25,
            weather_type=WeatherType.CLEAR,
            sunrise=datetime.fromisoformat("2022-06-13 04:00:00"),
            sunset=datetime.fromisoformat("2022-06-13 21:00:00"),
            city="Moscow",
        )
    )
    print(result)
    """
    Moscow, температура 25°C, Ясно
    Восход: 04:00
    Закат: 21:00
    """
