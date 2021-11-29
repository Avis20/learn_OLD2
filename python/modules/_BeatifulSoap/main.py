import requests as r
from bs4 import BeautifulSoup
from pprint import pprint

URL = "https://shikimori.one/animes/41025-fumetsu-no-anata-e"

response = r.get(URL)
print(response)

"""


# Запрашиваем страницу
URL = "https://github.com/Avis20/?tab=repositories"
response = r.get(URL)

soup = BeautifulSoup(response.content, "html.parser")

results = soup.find_all('section', id="user-repositories-list")
for item in results:
    repos = item.find_all('a')
    for rep in repos:
        if rep.attrs.get('itemprop'):
            print(rep.text, end="")

"""