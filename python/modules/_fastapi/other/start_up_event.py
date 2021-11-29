import uvicorn
from fastapi import FastAPI

app = FastAPI()

ITEMS = {}

@app.on_event('startup')
def init_items():
    ITEMS[1] = "test one"
    ITEMS[2] = "test two"


@app.get('/item/{item_id}')
def get_item(item_id: int):
    return {"item": ITEMS.get(item_id)}


if __name__ == '__main__':
    uvicorn.run("start_up_event:app", host="localhost", reload=True)
