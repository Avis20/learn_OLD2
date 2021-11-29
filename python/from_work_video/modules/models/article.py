from .base import BaseModel


class Article(BaseModel):
    def set_user(self, user):
        self.user = user

    def get_user(self):
        return self.user
