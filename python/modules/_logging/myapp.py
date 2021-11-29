# myapp.py
import logging
import logging.config
import mylib


if __name__ == '__main__':
    logging.config.fileConfig("logging.conf")
    logging.info('Started')
    mylib.do_something()
    logging.info('Finished')
