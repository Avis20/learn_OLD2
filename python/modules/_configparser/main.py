
import configparser
from pathlib import Path


def get_config():
    config = configparser.ConfigParser()
    config.read(Path.cwd() / 'config.ini')
    return config

if __name__ == '__main__':
    config = get_config()
    print(config.get('test', 'section'))
