


"""
import requests
from requests.adapters import HTTPAdapter
from requests.exceptions import ConnectTimeout

url = 'https://api.github.com'
adapter = HTTPAdapter(max_retries=10)
with requests.Session() as session:
    session.mount(url, adapter)

try:
    response = session.get(url, timeout=0.4)
except ConnectTimeout as err:
    print(f'->>> Error time out {err}')
else:
    print(f'Success {response.json()}')
"""