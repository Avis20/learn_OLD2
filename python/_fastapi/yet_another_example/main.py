# example from = (Денис Аникин. FastAPI как основной framework для python бекендов) - https://youtu.be/4zjj1aHJoko
# сек. = 7.27

from fastapi import FastAPI
import uvicorn

app: FastAPI = FastAPI()


FAKE_ITEMS_DB: list[dict[str, str]] = [
    {"item_name": "Foo"},
    {"item_name": "Bar"},
    {"item_name": "Baz"},
]


@app.get("/items")
async def read_items(skip: int = 0, limit: int = 10):
    print("\n\n")
    print("skip", skip, "limit", limit)
    print("\n\n")
    return FAKE_ITEMS_DB[skip : skip + limit]


if __name__ == "__main__":
    uvicorn.run("main:app", host="localhost", port=8008, reload=True)
