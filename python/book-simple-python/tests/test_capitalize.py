
import unittest
import capitalize


class TestCap(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_one_word(self):
        text = 'привет'
        assert_text = 'Привет'
        retult = capitalize.just_cap_text(text)
        self.assertEqual(retult, assert_text)

    def test_multple_words(self):
        text = 'привет, как дела?'
        assert_text = 'Привет, Как Дела?'
        retult = capitalize.just_cap_text(text)
        self.assertEqual(retult, assert_text)

    def test_multple_words_with_apostrohes(self):
        text = "i'm the best of the best"
        assert_text = "I'm The Best Of The Best"
        retult = capitalize.just_cap_text(text)
        self.assertEqual(retult, assert_text)

    def test_text_with_quotes(self):
        text = "Пример текста с \"кавычками\" и 'апострофами'"
        assert_text = "Пример Текста С \"кавычками\" И 'апострофами'"
        retult = capitalize.just_cap_text(text)
        self.assertEqual(retult, assert_text)


if __name__ == '__main__':
    unittest.main()
