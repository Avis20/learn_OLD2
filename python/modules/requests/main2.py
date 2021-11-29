import requests

url = 'https://api.github.com'
response = requests.get(url, timeout=0.06)
print(response.content)
