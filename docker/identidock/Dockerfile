from python:3.7

run groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

run pip install Flask==0.10.1 uWSGI==2.0.17.1 requests==2.5.1 redis==2.10.3
workdir /app
copy app /app
copy cmd.sh /

expose 9090 9191
user uwsgi

cmd /cmd.sh
