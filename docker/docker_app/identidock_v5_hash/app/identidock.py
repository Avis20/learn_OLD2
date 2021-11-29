from flask import Flask, Response, request
import requests
import hashlib

app = Flask(__name__)
salt="UNIQUE_SALT"
default_name = 'avis'

@app.route('/', methods=['GET', 'POST'])
def main_page():
    name = default_name

    if request.method == 'POST':
      name = request.form['name']

    salted_name = salt + name
    name_hash = hashlib.sha256( salted_name.encode() ).hexdigest()

    print(salted_name);

    header = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Identidock</title></head><body>'

    body = '''<form method="POST">
                Hello <input type="text" name="name" value="{}"/>
                <input type="submit" value="submit"/>
              </form>
              <p>You look like a:
                <img src="/monster/{}.png" alt="" />
              </p>
           '''.format(name, name_hash)

    footer = '</body></html>'

    return header + body + footer;

@app.route('/monster/<name>')
def get_identicon(name):
    res = requests.get('http://dnmonster:8080/monster/' + name + '?size=80')
    image = res.content

    return Response(image, mimetype='image/png')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
