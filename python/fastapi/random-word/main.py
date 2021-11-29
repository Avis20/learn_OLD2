import uvicorn
from fastapi import FastAPI, HTTPException
from phrase_model import PhraseInput, PhraseOut
from db import DataBase

db = DataBase()
app = FastAPI(
    title="Random phrase",
    debug=True,
)

@app.get('/')
def root():
    print("\n\n\n")
    print(db)
    print("\n\n\n")

@app.post('/add', response_description="Создание фразы", response_model=PhraseOut)
async def add(phrase: PhraseInput):
    phrase_out = db.add(phrase)
    return phrase_out

@app.get('/get', response_model=PhraseOut)
async def get(phrase_id: int):
    phrase = db.get(phrase_id)
    if not phrase:
        raise HTTPException(status_code=404, detail="Phrase not found")
    return phrase

if __name__ == '__main__':
    uvicorn.run(
        "main:app",
        host='localhost',
        port=8000,
        reload=True
    )