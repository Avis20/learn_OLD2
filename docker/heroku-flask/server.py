#!/usr/bin/env python3

from os import environ
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/echo/<param1>/<param2>')
def echo(param1, param2):
    return render_template('flask2.html', param1=param1, param2=param2)


if __name__ == '__main__':
    port = environ.get('PORT')
    app.run(port=port, debug=True)
