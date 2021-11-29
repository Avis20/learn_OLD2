
class BaseProduct():
    pass


class BeautyPrintMixin:
    pass


class Phone(BeautyPrintMixin, BaseProduct):
    type_name = 'телефон'

    def _calc_price(self):
        return self._price


def _calc_price(self):
    return self._price

if __name__ == '__main__':

    Phone2 = type('Phone2', (BeautyPrintMixin, BaseProduct), {
        'type_name': 'телефон',
        '_calc_price': _calc_price
    })

    phone_1 = Phone()
    phone_2 = Phone2()

    print('class type=[', type(Phone), ']; object type=[', type(phone_1), ']',
          sep='')

    print('class type=[', type(Phone2), ']; object type=[', type(phone_2), ']',
          sep='')

    print(vars(Phone))
    print(vars(Phone2))
