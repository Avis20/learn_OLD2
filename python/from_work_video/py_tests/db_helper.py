URL = "sqlite:///memory:"

class User:
    def __init__(self, user_name):
        self.user_name = user_name

    def __str__(self):
        return self.user_name

    def delete(self):
        print("User", self.user_name, "deleted")
        return True


class Engine:
    def __init__(self, url):
        self.url = url


class Connection:
    def __init__(self, engine):
        self.engine = engine

    def get_user(self, user_name):
        print(self.engine)
        return User(user_name)


def get_engine(url=URL):
    return Engine(url)


def get_connection(engine=None):
    if engine is None:
        engine = get_engine()
    return Connection(engine)


def get_user(user_name):
    conn = get_connection()
    return conn.get_user(user_name)

