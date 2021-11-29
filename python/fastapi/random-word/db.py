
from phrase_model import PhraseInput, PhraseOut
from typing import Dict, Optional

class DataBase:
    def __init__(self) -> None:
        self._items: Dict[int, PhraseOut] = {}

    def add(self, phrase:  PhraseInput) -> PhraseOut:
        phrase_id = len(self._items) + 1
        phrase_out = PhraseOut(id=phrase_id, **phrase.dict())
        self._items[phrase_id] = phrase_out
        return phrase_out

    def get(self, phrase_id: int) -> Optional[PhraseOut]:
        return self._items.get(phrase_id)