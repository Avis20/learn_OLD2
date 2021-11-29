from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime
from sqlalchemy.orm import sessionmaker, scoped_session, relationship, joinedload
from sqlalchemy import (
    create_engine,
    Column,
    Integer,
    String,
    Boolean,
    DateTime,
    ForeignKey
)

engine = create_engine('sqlite:///test.sqlite', echo=True)
Base = declarative_base(bind=engine)

session_factory = sessionmaker(bind=engine)
Session = scoped_session(session_factory)


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    name = Column(String(32), nullable=False)
    is_staff = Column(Boolean, nullable=False, server_default="0")
    create_at = Column(DateTime, default=datetime.utcnow())

    posts = relationship("Post", back_populates="user")

    def __str__(self):
        return f"{self.__class__.__name__}(id={self.id}, name={self.name}, is_staff={self.is_staff})"

    def __repr__(self):
        return str(self)


class Post(Base):
    __tablename__ = "posts"

    id = Column(Integer, primary_key=True)
    title = Column(String(255), nullable=False, default='', server_default='')

    user_id = Column(Integer, ForeignKey(User.id), nullable=False)
    user = relationship("User", back_populates="posts")

    def __str__(self):
        return f"{self.__class__.__name__}(id={self.id}, title={self.title}, user={self.user})"

    def __repr__(self):
        return str(self)


def create_users():
    session = Session()

    admin = User(name='admin', is_staff=True)
    print("перед insert =", admin)

    guest = User(name='guest', is_staff=False)
    print("перед insert =", guest)

    session.add(admin)
    session.add(guest)
    session.commit()
    print("после insert =", admin)
    print("после insert =", guest)

    session.close()


def update_users():
    session = Session()

    guest: User = session.query(User).filter_by(name='guest').one()
    guest.create_at = datetime.utcnow()

    session.commit()
    session.close()


def create_posts():
    session = Session()

    guest = session.query(User).filter_by(name='guest').one()
    print("---> guest posts before", guest.posts)

    post1 = Post(title="Radio Tapok - Augen Auf", user_id=guest.id)
    post2 = Post(title="The Enigma Tng - One Last Hope", user=guest)
    session.add(post1)
    session.add(post2)
    session.commit()

    print(post1)
    print(post2)
    print("---> guest posts after", guest.posts)

    session.close()


def test_join():
    session = Session()

    guest: User = (
        session
            .query(User)
            .filter_by(name="guest")
            .options(joinedload(User.posts))
            .one()
    )

    print(guest.posts)

    session.close()


def query_by_join():
    session = Session()

    # вытащить только пользователя
    guest: User = (
        session
            .query(User)
            .join(Post)
            .filter(
                Post.title.ilike("%tapok%")
            )
            .first()
    )
    print("---> user with Tapok post =", guest)

    # вытащить и пользователя и пост который искали
    result: User = (
        session
            .query(User, Post)
            .join(Post)
            .filter(
                Post.title.ilike("%tapok%")
            )
            .first()
    )
    print("---> user with Tapok post from result =", result)

    session.close()


if __name__ == '__main__':
    Base.metadata.create_all()
    # create_users()
    # update_users()
    # create_posts()
    # test_join()
    query_by_join()
