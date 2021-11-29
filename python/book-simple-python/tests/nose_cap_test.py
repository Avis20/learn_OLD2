
import capitalize
from nose.tools import eq_


def test_one_word():
    text = 'привет'
    assert_text = 'Привет'
    result = capitalize.just_cap_text(text)
    eq_(result, assert_text)


def test_multple_words():
    text = 'привет, как дела?'
    assert_text = 'Привет, Как Дела?'
    retult = capitalize.just_cap_text(text)
    eq_(retult, assert_text)


def test_multple_words_with_apostrohes():
    text = "i'm the best of the best"
    assert_text = "I'm The Best Of The Best"
    retult = capitalize.just_cap_text(text)
    eq_(retult, assert_text)


def test_text_with_quotes():
    text = "Пример текста с \"кавычками\" и 'апострофами'"
    assert_text = "Пример Текста С \"Кавычками\" И 'Апострофами'"
    retult = capitalize.just_cap_text(text)
    eq_(retult, assert_text)
