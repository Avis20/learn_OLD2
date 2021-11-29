import config
import logging

from aiogram import Bot, Dispatcher, executor, types
from aiogram.contrib.middlewares.logging import LoggingMiddleware
from aiogram.types import ContentTypes, ContentType
# повысим log_level с info на debug
logging.basicConfig(level=logging.DEBUG)

# берем токен из модуля config
# в модуле config, токен берется из переменных окружения
bot = Bot(token=config.TOKEN)
dp = Dispatcher(bot)

# подключаем логирование в диспатчер
dp.middleware.setup(LoggingMiddleware())


# декоратор который вызовется если сообщение будет текстовое
@dp.message_handler(content_types=ContentTypes.TEXT)
async def echo_msg(message: types.message):
    return await message.reply(message.text)
    # # получаем объект пользователя которые отправил сообщение
    # user_sender = message.from_user
    # # отправляем сообщение по id пользователя
    # await message.bot.send_message(user_sender.id, text=f"Привет, {user_sender.full_name}")


@dp.message_handler(content_types=ContentTypes.STICKER | ContentTypes.ANIMATION)
async def handler_sticker_or_animation(message: types.message):
    if message.content_type == ContentType.STICKER:
        logging.info("id = %s", message.sticker.file_id)
        id = message.sticker.file_id
        return await message.answer_sticker(id)
    return await message.answer('AAAAAAAA')


if __name__ == '__main__':
    # пингуем сервер телеграм пока не получим ответ
    # по умолчанию timeout=20 сек
    executor.start_polling(dp)
