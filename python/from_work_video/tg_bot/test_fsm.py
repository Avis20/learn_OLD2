import logging

import aiogram.utils.markdown as md
from aiogram import Bot, Dispatcher, types
from aiogram.contrib.fsm_storage.memory import MemoryStorage
from aiogram.dispatcher import FSMContext
from aiogram.dispatcher.filters import Text
from aiogram.dispatcher.filters.state import State, StatesGroup
from aiogram.types import ParseMode
from aiogram.utils import executor
from pathlib import Path

# подключаем конфиг и токен
# токен в env
import config
logging.basicConfig(level=logging.DEBUG)
bot = Bot(token=config.TOKEN)

# Сохраняем состояние каждого пользователя в памяти
# TODO: можно как-то сохранить в файл (редис), но надо понять как
storage = MemoryStorage()
dp = Dispatcher(bot, storage=storage)

gender_list = ["Парень", "Девушка"]

# Группа состояний
class Form(StatesGroup):
    name = State()  # Will be represented in storage as 'Form:name'
    age = State()  # Will be represented in storage as 'Form:age'
    gender = State()  # Will be represented in storage as 'Form:gender'


@dp.message_handler(commands='start')
async def cmd_start(message: types.Message):
    """
    Conversation's entry point
    """
    # Устанавливаем текущее состояние - след. вызов попадет в декоратор со state=Form.name
    await Form.name.set()

    await message.reply("Напиши как тебя зовут")


# You can use state '*' if you need to handle all states
# Если при любом состоянии пришла команда cancel
# или просто был введен текст cancel, то чистим сторадж
@dp.message_handler(state='*', commands='cancel')
@dp.message_handler(Text(equals='cancel', ignore_case=True), state='*')
async def cancel_handler(message: types.Message, state: FSMContext):
    """
    Allow user to cancel any action
    """
    current_state = await state.get_state()
    if current_state is None:
        logging.info("No state already")
        return

    logging.info('Cancelling state %r', current_state)
    # Отменяем
    await state.finish()
    # And remove keyboard (just in case)
    await message.reply('Отменено.', reply_markup=types.ReplyKeyboardRemove())

# Для состояния ввода имени - сохраняем имя, переходим к след состоянию и выводим сообщение
@dp.message_handler(state=Form.name)
async def process_name(message: types.Message, state: FSMContext):
    """
    Process user name
    """
    async with state.proxy() as data:
        data['name'] = message.text

    await Form.next()
    await message.reply("Отлично, " + data['name'] + ", сколько тебе лет?")


# Для состояния Form.age, проверяем что было введено число
# Если не число (весь текст состоит из чисел) - сообщене об ошибке
@dp.message_handler(lambda message: not message.text.isdigit(), state=Form.age)
async def process_age_invalid(message: types.Message):
    """
    If age is invalid
    """
    return await message.reply("Возраст как-то неправильно написан. Попробуй еще раз")


# Пришло число и состояние = Form.age - сохраняем и переходим к след
@dp.message_handler(lambda message: message.text.isdigit(), state=Form.age)
async def process_age(message: types.Message, state: FSMContext):
    # Update state and data
    await Form.next()
    await state.update_data(age=int(message.text))

    # Configure ReplyKeyboardMarkup
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True, selective=True)
    markup.add(*gender_list)

    await message.reply("Теперь выбери свой пол:", reply_markup=markup)

# Если выбран не тот пол (?)
@dp.message_handler(lambda message: message.text not in gender_list, state=Form.gender)
async def process_gender_invalid(message: types.Message):
    """
    In this example gender has to be one of: Male, Female, Other.
    """
    return await message.reply("Выбери пол из списка")


# Сохраняем пол и выводим данные
@dp.message_handler(state=Form.gender)
async def process_gender(message: types.Message, state: FSMContext):
    async with state.proxy() as data:
        data['gender'] = message.text

        # Remove keyboard
        markup = types.ReplyKeyboardRemove()

        # And send message
        await bot.send_message(
            message.chat.id,
            md.text(
                md.text('Отлично, вся необходимая информация получена.'),
                md.text('Сейчас мы покажем тебе, как выглядит твой профиль:'),
                md.text('Имя:', md.bold(data['name'])),
                md.text('Возраст:', md.code(data['age'])),
                md.text('Пол:', data['gender']),
                md.text("\nВ скором времени тебе должны обязательно написать, дождись пожалуйста и никуда не уходи 😊"),
                sep='\n',
            ),
            reply_markup=markup,
            parse_mode=ParseMode.MARKDOWN,
        )

    # Finish conversation
    await state.finish()


if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)
