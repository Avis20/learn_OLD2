# main.py
from coordinates import get_gps_coordinates
from weather_api_services import get_weather
from weather_formatter import format_weather


def main():
    coordinates = get_gps_coordinates()
    weather = get_weather(coordinates)
    print(format_weather(weather))


if __name__ == "__main__":
    main()
    # >>> Weather(
    # >>>     temperature=20,
    # >>>     weather_type=<WeatherType.CLEAR: 'Ясно'>,
    # >>>     sunrise=datetime.datetime(2022, 6, 5, 23, 19, 3),
    # >>>     sunset=datetime.datetime(2022,6, 5, 23, 19, 3),
    # >>>     city='Moscow')
    # >>> Возвращает данные для печати погоды из структуры weather
