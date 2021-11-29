from flask import Flask, request
app = Flask(__name__)


@app.route('/', methods=["GET", "POST"])
def hello_world():
    return f"Query string = {[p for p in request.args.items()]}\n"


if __name__ == '__main__':
    app.run(
        host='localhost',
        port=5000,
        debug=True
    )
