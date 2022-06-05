from dataclasses import dataclass
from datetime import datetime


@dataclass
class User:
    username: str
    created_at: datetime
    brithday: datetime | None = None


def validate_user_on_server(_):
    pass


def check_username(_):
    pass


def validate_user(user: User):
    """Валидация пользователя

    Args:
        user (User): _description_
    """
    validate_user_on_server(user)
    check_username(user)


user_id = 123
# IDE подскажет ошибку т.к. ожидается объект User
validate_user(user_id)
