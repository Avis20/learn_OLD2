from dataclasses import dataclass


@dataclass
class User:
    username: str


def validate_user_on_server(_):
    pass


def validate_user(user: User):
    """Валидация пользователя

    Args:
        user (User): _description_
    """
    validate_user_on_server(user)


user_id = 123
validate_user(user_id)
