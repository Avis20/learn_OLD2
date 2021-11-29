from sqlalchemy.orm import relationship
from datetime import datetime
from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    DateTime
)

from .base import Base


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

