
from bs4 import BeautifulSoup as soup

import os

HOST = 'https://shikimori.one/animes/39247-kobayashi-san-chi-no-maid-dragon-s'
response = os.system(f'curl -X GET {HOST}')