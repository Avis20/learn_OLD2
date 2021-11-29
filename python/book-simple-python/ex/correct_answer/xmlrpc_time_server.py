
from datetime import datetime
from xmlrpc.server import SimpleXMLRPCServer


def now():
    data = str(datetime.now())
    print("Server send:", data)
    return data


if __name__ == '__main__':
    address = ('localhost', 6789)
    server = SimpleXMLRPCServer(address)
    server.register_function(now, "now")
    server.serve_forever()
