import logging

import requests as r
from bs4 import BeautifulSoup
from pprint import pprint

"""
import http.client as http_client
http_client.HTTPConnection.debuglevel = 1

logging.basicConfig()
logging.getLogger().setLevel(logging.INFO)
requests_log = logging.getLogger("requests.packages.urllib3")
requests_log.setLevel(logging.INFO)
requests_log.propagate = True
"""

URL = "https://shikimori.one/animes/39247-kobayashi-san-chi-no-maid-dragon-s"

response = r.get(URL, headers={
    'accept': "*/*",
    'User-Agent': 'Mozilla/5.0',
})

soup = BeautifulSoup(response.content, "html.parser")
print(soup)
results = soup.find_all('section', { "class": "l-page"})
print(results)
# for item in results:
#     repos = item.find_all('a')
#     for rep in repos:
#         if rep.attrs.get('itemprop'):
#             print(rep.text, end="")
#
#
