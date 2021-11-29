from .base import BaseModel
from .article import Article


class User(BaseModel):
    def add_article(self, name):
        article = Article(name)
        article.set_user(self)
        self.article = article
