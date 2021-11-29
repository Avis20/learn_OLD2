from flask import Flask, Response
import requests

app = Flask(__name__)

default_name = 'avis'

@app.route('/')
def main_page():
    name = default_name
    header = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Identidock</title></head><body>'

    body = '''<from method="POST">
                Hello <input type="text" name="name" value="{}"/>
                <input type="submit" value="submit"/>
              </from>
              <p>You look like a:
                <img src="/monster/monster.png" alt="" />
              </p>
           '''.format(name)

    footer = '</body></html>'

    return header + body + footer;

@app.route('/monster/<name>')
def get_identicon(name):
    res = requests.get('http://dnmonster:8080/monster/' + name + '?size=80')
    image = res.content

    return Response(image, mimetype='image/png')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
