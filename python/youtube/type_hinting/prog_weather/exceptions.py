# exceptions.py


class ErrorGetCoordinates(Exception):
    """Program can't get current GPS coordinates"""
    pass


class ErrorAPIService(Exception):
    """Program can't get current weather"""
    pass
