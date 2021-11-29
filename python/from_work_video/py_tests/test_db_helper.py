
from unittest import mock
from pytest import fixture
from db_helper import (
    User,
    Connection,
    Engine,
    get_connection,
    get_user
)

@fixture
def user():
    print("Create user")
    user = User('admin')
    # Возвращаем объект user через yield чтобы по завершению теста вызвать user.delete()
    yield user
    user.delete()


class TestUser:
    def test_init(self):
        user_name = 'admin'
        u = User(user_name)
        assert u.user_name == user_name

    def test_delete(self):
        u = User('test')
        res = u.delete()
        assert res is True


def test_get_connection():
    conn = get_connection()
    assert isinstance(conn, Connection)
    assert isinstance(conn.engine, Engine)


@mock.patch("db_helper.get_connection")
def test_get_user(mocked_get_connection, user):
    user_name = 'user_name'
    mocked_conn_get_user = mocked_get_connection.return_value.get_user
    mocked_conn_get_user.return_value = user
    res = get_user(user_name)
    assert res is user
