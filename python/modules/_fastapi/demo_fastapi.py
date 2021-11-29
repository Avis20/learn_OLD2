from fastapi import FastAPI, Request, Response, exceptions, Header, Cookie, Depends
from demo_pydantic import Item, User, UserBase, UserOut

app = FastAPI()
ids = iter(range(1, 1000))
USERS_BY_IDS = {}
USERS_BY_TOKENS = {}


@app.get('/')
def hello_world():
    """
    ## Hello world
    1. Json object
    1. message is string
    1. return example: `{"message": "Hello world"}`
    """
    return {"message": "Hello world"}


@app.get('/item/{item_id}', tags=["items"])
def get_item(item_id: int):
    return {"item_id": item_id}


@app.get('/items/{item_id}', tags=["items"])
def root_item(item_id: int, request: Request):
    return {"client_host": request.client.host, "item_id": item_id}


@app.post('/item', tags=["items"])
def create_item(item: Item):
    return {"item": item.dict()}


@app.post('/users/', response_model=UserOut, tags=["user"])
def create_user(user_in: UserBase):
    user = User(id=next(ids), **user_in.dict(exclude_none=True))
    USERS_BY_IDS[user.id] = user
    USERS_BY_TOKENS[user.token] = user
    return {"user": user.dict()}


@app.get('/users/{user_id}', response_model=User, tags=["user"])
def get_user_by_id(user_id: int):
    user = USERS_BY_IDS.get(user_id)
    if user is None:
        raise exceptions.HTTPException(404, {"message": f"User with id #{user_id} not found", "user_id": user_id})
    return user


def get_user_by_token(token: str) -> User:
    user = USERS_BY_TOKENS.get(token)
    if user is None:
        raise exceptions.HTTPException(404, {"message": f"User with token #{token} not found", "token": token})
    return user


def get_current_user(token: str = Header(..., description="user auth token")) -> User:
    return get_user_by_token(token)


@app.get('/users/me/', response_model=User, tags=["user"])
def get_me(user: User = Depends(get_current_user)):
    return user


@app.get('/cookies/set')
def set_cookies(response: Response):
    response.headers['X-App-Name'] = __name__
    response.set_cookie('hello', 'world')
    return {"message": "set cookie and get header"}


@app.get('/cookies/get')
def get_cookies(
        cookies: str = Cookie(..., alias='hello'),
        test: int = None
):
    return {"cookies": cookies}
