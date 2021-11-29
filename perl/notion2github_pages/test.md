# Глава 1. Python: с чем его едят

Created: Jan 24, 2021 11:27 AM

В книге пример с youtube, но ссылка похоже очень старая и уже давно не работает - [https://gdata.youtube.com/feeds/api/standardfeeds/top_rated?alt=json](https://gdata.youtube.com/feeds/api/standardfeeds/top_rated?alt=json)

В место нее я использовал json placeholder - [https://jsonplaceholder.typicode.com/users](https://jsonplaceholder.typicode.com/users)

Без библиотеки requests

```python
import json # Импорт всей библиотеки json
from urllib.request import urlopen

url = "https://jsonplaceholder.typicode.com/users"

response = urlopen(url)
content = response.read()
text = content.decode('utf8')
data = json.loads(text)

for user in data:
   print(user['username'], ' - ', user['email'], ' - ', user['phone'])
```

- exp
    1. Импорт всей библиотеки json
    2. Импорт только функции urlopen из либы urllib.request
    3. Присвоение переменной значения с url до api
    4. Делаем запрос на сервер
    5. Записываем ответ от сервера в переменную content
    6. Декодим ответ от сервера
    7. Преобразуем строку с json в структуру для работы в python
    8. Цикл по списку пользователей
    9. Вывод данных о юзере
- пример json-а

    ```bash
    [
      {
        "username": "Bret",
        "email": "Sincere@april.biz",
        "phone": "1-770-736-8031 x56442"
      },
      {
        "username": "Antonette",
        "email": "Shanna@melissa.tv",
        "phone": "010-692-6593 x09125"
      },
    ]
    ```

С библиотекой 

```python
import requests
url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url)
data = response.json()
for user in data:
    print(user['username'], ' - ', user['email'], ' - ', user['phone'])
```

- exp
    1. Импорт всей библиотеки requests
    2. Присвоение переменной значения url-а
    3. Выполнение запроса
    4. Пока не знаю
    5. Вывод информации о пользователе

ответ

```bash
$ python3 request_example.py 
Bret  -  Sincere@april.biz  -  1-770-736-8031 x56442
Antonette  -  Shanna@melissa.tv  -  010-692-6593 x09125
Samantha  -  Nathan@yesenia.net  -  1-463-123-4447
Karianne  -  Julianne.OConner@kory.org  -  493-170-9623 x156
Kamren  -  Lucio_Hettinger@annie.ca  -  (254)954-1289
Leopoldo_Corkery  -  Karley_Dach@jasper.info  -  1-477-935-8478 x6430
Elwyn.Skiles  -  Telly.Hoeger@billy.biz  -  210.067.6132
Maxime_Nienow  -  Sherwood@rosamond.me  -  586.493.6943 x140
Delphine  -  Chaim_McDermott@dana.io  -  (775)976-6794 x41206
Moriah.Stanton  -  Rey.Padberg@karina.biz  -  024-648-3804
```

# Глава 2. Ингредиенты Python: числа, строки и переменные

Created: Jan 24, 2021 11:27 AM

Присваивание переменной

```python
>>> a = 2
>>> print(a)
2
>>> b = a
>>> print(b)
2
>>>
```

### Узнать тип переменной `type`

```python
>>> type(a)
<class 'int'>
>>> type(b)
<class 'int'>
>>> type(21)
<class 'int'>
>>> type(9.9)
<class 'float'>
>>> type('dsa')
<class 'str'>
>>>
```

### Зарезервированные слова

[Зарезервированные слова](%D0%93%D0%BB%D0%B0%D0%B2%D0%B0%202%20%D0%98%D0%BD%D0%B3%D1%80%D0%B5%D0%B4%D0%B8%D0%B5%D0%BD%D1%82%D1%8B%20Python%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0,%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%208afe12d8f91547609d0ec67bd923e1c9/%D0%97%D0%B0%D1%80%D0%B5%D0%B7%D0%B5%D1%80%D0%B2%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B5%20%D1%81%D0%BB%D0%BE%D0%B2%D0%B0%200dd815cbd19f4ed2b7bef379b085bc63.md)

## Числа

### Целые числа (`int`)

Пример

```python
>>> 58
58
>>> a = 58
>>> print(a)
58
>>> type(a)
<class 'int'>
>>>
```

### Преобразование в целое число `int`

```python
>>> int(True)
1
>>> int(89.2)
89
>>> int('89')
89
>>>
```

Преобразовать строку к Int можно только если в строке валидное число
Иначе будет исключение

```python
>>> int('89.2')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: '89.2'

```

### Дробные числа (`float`)

Пример

```python
>>> 89.2
89.2
>>> b = 25.3
>>> print(b)
25.3
>>> type(b)
<class 'float'>
>>>
```

### Преобразование в дробное число `float`

```python
>>> float(True)
1.0
>>> float(89)
89.0
>>> float('89')
89.0
>>> float('89.1')
89.1
```

Тоже самое и с дробным числом

```python
>>> float('89.1a')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: could not convert string to float: '89.1a'
>>>
```

### Операторы

[Операторы](%D0%93%D0%BB%D0%B0%D0%B2%D0%B0%202%20%D0%98%D0%BD%D0%B3%D1%80%D0%B5%D0%B4%D0%B8%D0%B5%D0%BD%D1%82%D1%8B%20Python%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0,%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%208afe12d8f91547609d0ec67bd923e1c9/%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80%D1%8B%202067b892ceeb49fca2c051612b199c03.csv)


Преобразовать строку к Int можно только если в строке валидное число
Иначе будет исключение

```python
>>> int('89.2')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: '89.2'

```


```python
$ python3 ./test.py && cat ./settings.cfg 
<configparser.ConfigParser object at 0x7f4d32eaaa90>
<Section: settings>
file

[settings]
test = file
```
