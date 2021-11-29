from datetime import datetime
from pydantic import BaseModel, Field
from uuid import uuid4


def generate_token():
    return str(uuid4())


class UserBase(BaseModel):
    user_name: str
    is_staff: bool = False
    created_at: datetime = Field(default_factory=datetime.now)


class User(UserBase):
    id: int
    token: str = Field(default_factory=generate_token)


class UserOut(BaseModel):
    user: User


class Item(BaseModel):
    name: str
