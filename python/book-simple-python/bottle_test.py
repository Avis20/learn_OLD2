#!/usr/bin/env python3

import requests

response = requests.get('http://localhost:9999/echo/Test')

if response.status_code == 200 and response.text == "Hello Test\n":
    print("ok")
else:
    print("not ok; got =", response.text)
