
from xmlrpc.client import ServerProxy

proxy = ServerProxy("http://localhost:6789")
data = proxy.now()
print("Client get: ", data)
