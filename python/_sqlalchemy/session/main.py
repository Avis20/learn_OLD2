
# https://www.notion.so/avis/SQLAlchemy-d633e925a80548bea906a84b4c5e79a7

import sys
import logging
import sqlalchemy as sa
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy.ext.declarative import declarative_base


fmt = logging.Formatter(
    fmt="%(asctime)s - %(name)s:%(lineno)d - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.StreamHandler(sys.stdout)
logger.setLevel(logging.DEBUG)
logger.setFormatter(fmt)

logger_db = logging.getLogger("sqlalchemy")
logger_db.setLevel(logging.DEBUG)
# logger_db.addHandler(logger)

# Мета информация для БД
metadata = sa.MetaData()
BaseModel = declarative_base(metadata=metadata)
engine = sa.create_engine("postgresql+psycopg2://user:pass@localhost:5432/db_name", echo=True)
Session = sessionmaker(bind=engine)


class User(BaseModel):
    __tablename__ = "users"
    __table_args__ = (
        sa.PrimaryKeyConstraint("id", name="users_pkey"),
        sa.Index("username_uniq", "username", unique=True),
    )

    id = sa.Column(sa.Integer, nullable=False)
    username = sa.Column(sa.String(255), nullable=False)
    name = sa.Column(sa.String(255), nullable=True)
    last_name = sa.Column(sa.String(255), nullable=True)

    phones = relationship("PhoneNumber", back_populates="user")


class PhoneNumber(BaseModel):
    __tablename__ = "phone_numbers"

    id = sa.Column(sa.Integer, primary_key=True, nullable=False)
    number = sa.Column(sa.String(255), nullable=False)
    user_id = sa.Column(sa.Integer, sa.ForeignKey(User.id), nullable=False)

    user = relationship("User", back_populates="phones")


def process_users(user_recodrs):
    with Session() as session:
        for user_record in user_recodrs:

            # Никаких запросов в БД не идет, просто создается объект
            user = User(**user_record.get("user"))
            session.add(user)

            for entry in user_record.get("entries"):
                if entry.get("type") == "phone":
                    # Тоже самое
                    phone = PhoneNumber(user=user, number=entry.get("number"))
                    session.add(phone)
                elif entry.get("type") == "fields":
                    # Изменяются поля в том числе и в сессии
                    user.name = entry.get("name")
                    user.last_name = entry.get("last_name")

        # Сессия откроет транзакцию, отправит запросы и выполнит коммит
        session.commit()


"""
INFO - BEGIN (implicit)
INFO - INSERT INTO users (username, name, last_name) VALUES (%(username)s, %(name)s, %(last_name)s) RETURNING users.id
INFO - [generated in 0.00033s] ({'username': 'Дональдь', 'name': 'Дональд', 'last_name': 'Дак'}, {'username': 'username Тест 2', 'name': 'name Тест 3', 'last_name': 'last_name Тест 3'})
DEBUG - Col ('id',)
DEBUG - Row (1,)
DEBUG - Row (2,)
INFO - INSERT INTO phone_numbers (number, user_id) VALUES (%(number)s, %(user_id)s) RETURNING phone_numbers.id
INFO - [generated in 0.00022s] {'number': '89252618050', 'user_id': 1}
DEBUG - Col ('id',)
DEBUG - Row (1,)
INFO - COMMIT
"""

def get_users():
    with Session() as session:
        u1 = session.query(User).filter_by(username='Дональдь').one()
        u2 = session.query(User).filter_by(username='Дональдь').one()
        u3 = session.query(User).get(1)
        u4 = session.query(User).filter_by(id=1).one()

        # в БД уйдет только 3 запроса, остальное кеш
        assert u1 == u2 == u3 == u4

def process_user_one(session):
    u = session.query(User).get(1)
    u.name = "Don"
    return u

def process_user_two(session):
    u = session.query(User).get(1)
    if u.name == "Don":
        p = PhoneNumber(user=u, number="321321")
        session.add(p)
    u.name = "Donald"
    return u

def one_and_two_user():
    with Session() as session:
        u1 = process_user_one(session)
        u2 = process_user_two(session)

        assert u1.name == u2.name

if __name__ == "__main__":
    res = BaseModel.metadata.create_all(engine)
    print("AAAAAAAAAAA")
    print(res)
    get_users()
    # one_and_two_user()
"""
    USERS_RECORDS = [
        {
            "user": {"username": "Дональдь", "name": "Дональд", "last_name": "Дак"},
            "entries": [{"type": "phone", "number": "89252618050"}],
        },
        {
            "user": {
                "username": "username Тест 2",
                "name": "name Тест 2",
                "last_name": "last_name Тест 2",
            },
            "entries": [
                {
                    "type": "fields",
                    "name": "name Тест 3",
                    "last_name": "last_name Тест 3",
                }
            ],
        },
    ]

    process_users(USERS_RECORDS)
"""

