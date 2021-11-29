
from models import User

user = User('Вася')
print(user.name)

user.add_article('Евровидение 2021')
print(user.article.name)

print("Before change ", user.article.get_user().name)
user.article.change_user('Петя')
print("After change ", user.article.get_user().name)
