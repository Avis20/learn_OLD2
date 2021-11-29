import requests
url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url)
data = response.json()
for user in data:
    print(user['username'], ' - ', user['email'], ' - ', user['phone'])