
import sys
import logging
import sqlalchemy as sa
from sqlalchemy.orm import sessionmaker
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
logger_db.addHandler(logger)

metadata = sa.MetaData()
BaseModel = declarative_base(metadata=metadata)
engine = sa.create_engine('postgresql+psycopg2://user:pass@localhost:5432/db_name')
Session = sessionmaker(bind=engine)

class User(BaseModel):
    __tablename__ = "users"
    __table_args__ = (
        sa.PrimaryKeyConstraint("id", name="users_pkey"),
        sa.Index("username_uniq", "username", unique=True)
    )

    id = sa.Column(sa.Integer, nullable=False)
    username = sa.Column(sa.String(255), nullable=False)
    name = sa.Column(sa.String(255), nullable=True)
    last_name = sa.Column(sa.String(255), nullable=True)


class PhoneNumber(BaseModel):
    __tablename__ = "phone_numbers"

    id = sa.Column(sa.Integer, primary_key=True, nullable=False)
    number = sa.Column(sa.String(255), nullable=False)
    user_id = sa.Column(sa.Integer, sa.ForeignKey(User.id), nullable=False)





def process_users(user_recodrs):
    with Session() as session:
        for user_record in user_recodrs:
            user = User(**user_record.get('user'))
            session.add(user)


if __name__ == '__main__':
    BaseModel.metadata.create_all(engine)
    USERS_RECORDS = [
        {
            'user': {
                'username': 'Дональдь',
                'name': 'Дональд',
                'last_name': 'Дак'
            },
            'entries': [{
                'type': 'phone',
                'phone': '89252618050'
            }]
        }
    ]

    process_users(USERS_RECORDS)
