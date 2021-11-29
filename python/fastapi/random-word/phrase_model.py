
from typing import Optional
from pydantic import BaseModel, Field

class PhraseInput(BaseModel):
    author: str = "Anonymus"
    text: str = Field(..., title="Text", max_length=200)


class PhraseOut(PhraseInput):
    id: Optional[int] = None
