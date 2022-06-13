ROUND_COORDS = None

OPENWEATHER_API_KEY = "216e05ccca175349acb046d86eb3e2f5"
OPENWEATHER_URL_TEMPLATE2 = "https://ya.ru"
OPENWEATHER_URL_TEMPLATE = (
    "https://api.openweathermap.org/data/2.5/weather?"
    "lat={latitude}&lon={longitude}&"
    "appid=" + OPENWEATHER_API_KEY + "&lang=ru&"
    "units=metric"
)
