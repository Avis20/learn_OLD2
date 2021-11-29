
from twisted.internet import protocol, reactor


class Knock(protocol.Protocol):
    def dataReceived(self, data):
        print("Client: ", data)
        response = ''
        if data.startswith("Knock knock"):
            response = "test"
        else:
            response = "test2"
        print("Server: ", response)
        self.transport.write(response)


class KnockFactory(protocol.Factory):
    def buildProtocol(self, add):
        return Knock


if __name__ == '__main__':
    reactor.listenTCP(8000, KnockFactory)
    reactor.run()
