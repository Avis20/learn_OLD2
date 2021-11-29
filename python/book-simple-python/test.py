#!/usr/bin/env python3

from timeit import repeat
print(repeat("num = 5; num *= 500", repeat=5))

'''
if __name__ == '__main__':
    n = 5
    array = [2, 3, 6, 6, 5]
    max = 0
    for i in range(n):
        if array[i] > max:
            max = array[i]

    prev_max = 0
    for i in range(n):
        if array[i] > prev_max and array[i] < max:
            prev_max = array[i]

    print(prev_max)
    # n = int(input())
    # print("n =", n, 'type =', type(n))
    # array = map(int, input().split())
    # print("array =", array, 'type =', type(array))
'''

'''
if __name__ == '__main__':

    array = []
    x, y, z, n = (1, 1, 2, 3)

    for i in range(0, x + 1):
        for j in range(0, y + 1):
            for k in range(0, z + 1):
                if i + j + k != n:
                    array.append([i, j, k])
    print(array)

'''

# from datetime import date, timedelta

# brightday = date(1995, 6, 15)
# print(brightday)
# # 1995-06-15

# ten_k = timedelta(days=10000)
# print(brightday + ten_k)
# # 2022-10-31


# 1995-06-15

# brightday = date(1995, 6, 15)

# test = time.localtime(brightday)


# print(brightday)
# 1995-06-15


'''
from random import choice
from time import sleep
from datetime import datetime
import os
import multiprocessing as mp


def to_sleep(time):
    print("Process %s sleep %s" % (os.getpid(), time))
    sleep(time)

if __name__ == '__main__':
    sleep_time = (1, 2, 3, 4, 5)
    now = datetime.now()
    print("Start =", now.hour, now.minute, now.second)
    for i in range(1, 4):
        st = choice(sleep_time)
        proc = mp.Process(target=to_sleep, args=(st,))
        proc.start()

print("Stop =", now.hour, now.minute, now.second)
'''


'''
# from datetime import date

today_string = ''
with open("today.txt", "rt") as file:
    today_string = file.read()

print(today_string.split('-'))
# ['2021', '02', '22']
'''

'''
from datetime import date

today = date.today()
print(today)

with open("today.txt", "wt") as file:
    file.write(today.isoformat())

'''

# import time

# fmt = "%Y-%m-%d"

# print(time.strptime("2020-01-06", fmt))
# time.struct_time(tm_year=2020, tm_mon=1, tm_mday=6, tm_hour=0, tm_min=0,
# tm_sec=0, tm_wday=0, tm_yday=6, tm_isdst=-1)


'''
import time

format = "Сегодня: %A, %B %d %Y. Локальное время: %H:%M:%S%p"

now = time.localtime()

print(time.strftime(format, now))
# Сегодня: Monday, February 22 2021. Локальное время: 14:39:42PM
'''

'''
from time import time, ctime

now = time()

print(now)
# 1613993148.653525

fnow = ctime(now)
print(fnow)
# Mon Feb 22 14:27:51 2021
'''

'''
from datetime import date, time, datetime

date = date.today()
time = time(12)

datetime = datetime.combine(date, time)

print(datetime)
# 2021-02-22 12:00:00
'''

'''
from datetime import datetime

now = datetime.now()

print(now)
# 2021-02-22 13:57:24.470408

print("day =", now.day, "month =", now.month, "year =", now.year,
      "hour =", now.hour, "minute =", now.minute, "second =", now.second)
# day = 22 month = 2 year = 2021 hour = 14 minute = 3 second = 56
'''

# print("hour =", now.hour, "minute =", now.minute, "second =", now.second)
# hours = 13 minute = 53 seconds = 0


'''
from datetime import date, timedelta

now = date.today()

print(now)
# 2021-02-22

one_day = timedelta(days=1)

print(now + one_day)
# 2021-02-23

print(now + one_day * 7)
# 2021-03-01
'''


# today = date(2021, 2, 22)

# print(today)
# # 2021-02-22

# print("day =", today.day, "month =", today.month, "year =", today.year)
# # day = 22 month = 2 year = 2021


# import calendar

# print(calendar.isleap(2021))
# # False

# print(calendar.isleap(2020))
# # True


'''
import subprocess
import multiprocessing as mp
import time
import os


def whoami(name):
    print("Я %s, PID=%s" % (name, os.getpid()))


def loop(name):
    whoami(name)
    start = 1
    stop = 1000
    for n in range(start, stop):
        print("\tNumber %s of %s; parent pid=%s" % (n, stop, os.getppid()))
        time.sleep(start)


if __name__ == '__main__':
    whoami("основной процесс main")
    proc = mp.Process(target=loop, args=("loopy", ))
    proc.start()
    time.sleep(3)
    print("I'll be back -_-")
    subprocess.call(['kill', str(os.getpid())])
'''

# import multiprocessing as mp
# import os
# import time


# def do_this(name):
#     whoami(name)


# def whoami(name):
#     time.sleep(5)
#     print("Процесс %s говорит: '%s'" % (os.getpid(), name))


# def loop(name)


# if __name__ == '__main__':
#     whoami('Я основная программа main')
#     for i in range(4):
#         proc = mp.Process(target=do_this, args=("Я функция %s" % i, ))
#         proc.start()
#     print("Конец main")


# import subprocess

# result = subprocess.call('date -u', shell=True)
# print(result)

# print('result=', result)

# import os
# print(os.getcwd())

# import os

# file_name = './text.txt'
# new_file_name = file_name + '.new.txt'

# with open(file_name, 'wt') as file:
#     file.write('hello\n')

# print(os.symlink(file_name, new_file_name))
# # None

# print(os.path.islink(new_file_name))
# # True

# print(os.remove(new_file_name))

# import os

# file_name = './text.txt'
# new_file_name = file_name + 'new.txt'

# with open(file_name, 'wt') as file:
#     file.write('hello\n')

# print(os.rename(file_name, new_file_name))
# # None

# print(os.path.exists(file_name))
# # False

# print(os.path.exists(new_file_name))
# # True

# import os
# import shutil

# file_name = './text.txt'
# new_file_name = file_name + 'new.txt'

# with open(file_name, 'wt') as file:
#     file.write('hello\n')

# shutil.copy(file_name, new_file_name)
# print(os.path.exists(new_file_name))

# import os

# file_name = './text.txt'

# with open(file_name, 'wt') as file:
#     file.write('hello\n')

# print("File exists? ", os.path.exists(file_name))
# # File exists?  True
# print("File exists? ", os.path.exists('alalala'))
# # File exists?  False

# print("is file?", os.path.isfile(file_name))
# # is file? True

# print("is file?", os.path.isfile('.'))
# # is file? False

# print("is dir?", os.path.isdir('.'))
# # is dir? True


# from flask import Flask, render_template, request

# app = Flask(__name__)


# @app.route('/')
# def home():
#     kwargs = {}
#     kwargs['thing'] = request.args.get('thing')
#     kwargs['height'] = request.args.get('height')
#     kwargs['color'] = request.args.get('color')
#     return render_template('home.html', **kwargs)


# app.run(debug=True)

'''
import sys
import requests
from bs4 import BeautifulSoup as soup


def get_links(url):
    result = requests.get(url)
    html = result.text
    doc = soup(html)
    print(type(doc))
    links = []
    for el in doc.find_all('a'):
        links.append(el.get('href'))
    return links


if __name__ == '__main__':
    for url in sys.argv[1:]:
        print(url)
        for num, link in enumerate(get_links(url)):
            print(num, link)
'''

# import webbrowser

# url = 'https://python.org'
# webbrowser.open_new_tab(url)

# from flask import Flask, request, render_template

# app = Flask(__name__)


# @app.route('/echo/')
# def echo():
#     kwargs = {}
#     kwargs['param1'] = request.args.get('param1')
#     kwargs['param2'] = request.args.get('param2')
#     return render_template('flask2.html', **kwargs)


# if __name__ == '__main__':
#     app.run(port=9999, debug=True)

'''
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/echo/<thing>')
def echo(thing):
    return render_template('flask.html', thing=thing)


app.run(port=9999, debug=True)
'''

'''
from bottle import route, run, static_file


@route('/')
def main():
    return static_file('index.html', root='.')


@route('/echo/<thing>')
def echo(thing):
    return "Hello %s\n" % thing

run(host='localhost', port=9999)
'''

'''
import requests
import json

url = 'http://api.quotable.io/random'
response = requests.get(url)
print(response)
# <Response [200]>

print(type(response.text))
print(response.text)
# <class 'str'>

data = json.loads(response.text)
print(data['content'])
# No one has ever become poor by giving.
'''

'''
import urllib.request as ur

url = 'http://api.quotable.io/random'
response = ur.urlopen(url)

for key, val in response.getheaders():
    print(key, '=', val)
'''

'''
import urllib.request as ur
import json

url = 'http://api.quotable.io/random'
response = ur.urlopen(url)
print(response)

json_str = response.read().decode('utf8')
data = json.loads(json_str)
print(data['content'])
'''
