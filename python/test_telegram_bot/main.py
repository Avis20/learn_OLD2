import logging

from aiogram import Bot, Dispatcher, executor, types
from aiogram.types import ContentTypes
logging.basicConfig(level=logging.INFO)

TOKEN = '1619204043:AAH56vPdnCBvS4P-z8cENZJ0VKXk4bAkOO8'
bot = Bot(token=TOKEN)
dp = Dispatcher(bot)


# декоратор который вызовется если сообщение будет текстовое
@dp.message_handler(content_types=ContentTypes.TEXT)
async def echo_msg(message: types.message):
    # повторяем сообщение которое отправил пользователь
    await message.reply(message.text)

if __name__ == '__main__':
    # пингуем сервер телеграм пока не получим ответ
    # по умолчанию timeout=20 сек
    executor.start_polling(dp)
