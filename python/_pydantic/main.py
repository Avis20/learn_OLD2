from pydantic import BaseModel


class SomeClass(BaseModel):
    name: str
    test1: None | str


json_input1 = """
{
    "city_id": 23,
    "name": "Moscow"
}
"""

some_object = SomeClass.parse_raw(json_input1)
print(some_object.dict())
print(some_object.dict(exclude_unset=True))
