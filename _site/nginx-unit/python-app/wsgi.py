import sys

def application(environ, start_response):
    body = sys.version.encode("utf-8")
    status = "200 OK"
    headers = [('Content-type','text/plain')]
    start_response(status, headers)
    return body