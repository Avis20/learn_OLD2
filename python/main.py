import telebot
from dadata import Dadata
import json
import requests

bot = telebot.TeleBot('5340633758:AAEPMt6MyUsQP7U71N3XDS2Z_M93w_CoOig')

@bot.message_handler(commands=["start"])
def welcome (message):
    bot.send_message(message.chat.id, "Добро пожаловать. Я бот который может показать тебе температуру в разных городах Росии. Скажи мне где ты живешь а я скажу сколько там градусов по цельсию :)".format(message.from_user, bot.get_me()), parse_mode='html')

@bot.message_handler(content_types=["text"])
def boltushka(message):
    def main(bad_adr):
        token = "17b4ed6a6f1148db88e344fc7f845c2432c9ba60"
        secret = "4e76858293ee26bc52e072cbdf637be1229d76bc"
        dadata = Dadata(token, secret)
        result = dadata.clean("address", bad_adr)
        if str(result.get('result')) == 'None':
            return("Я не знаю где находится '" + str(bad_adr) + "' :'(")
        else:
            lat = result.get("geo_lat")
            lon = result.get("geo_lon")
            adr = str(result.get('result'))
            url = "https://api.openweathermap.org/data/2.5/weather?appid=8565a87c82886e0282fc0a1167eb3eae&lat=" + str(lat) + "&lon=" + str(lon) + "&units=metric"
            response = requests.get(url)
            response_bytes = response.content
            json_content = json.loads(response_bytes)
            main = json_content["main"]
            return('Сейчас по адресу: ' + adr + '. Температура составляет: ' + str(main.get("temp")) + " °C")
    bot.send_message(message.chat.id, main(message.text))   

if __name__ == '__main__':
     bot.infinity_polling()