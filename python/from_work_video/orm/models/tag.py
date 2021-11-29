from sqlalchemy.orm import relationship
from sqlalchemy import (
    Column,
    Integer,
    String,
)

from .base import Base
from .posts_tags import posts_tags_table


class Tag(Base):
    __tablename__ = "tags"

    id = Column(Integer, primary_key=True)
    name = Column(String(32), nullable=False)

    posts = relationship(
        "Post",
        secondary=posts_tags_table,
        back_populates="tags"
    )

    def __str__(self):
        return f"{self.__class__.__name__}(id={self.id}, name={self.name})"

    def __repr__(self):
        return str(self)
