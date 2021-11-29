from models import User, Article


def change_user(article, name):
    article.user = User(name)
