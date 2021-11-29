
import sys


def process_cities(file_name):
    with open(file_name, 'rt') as file:
        for line in file:
            line = line.strip()
            if 'quit' == line.lower():
                return
            country, city = line.split(',')
            country = country.strip()
            city = city.strip()
            print(country.title(), city.title(), sep=', ')

if __name__ == '__main__':
    process_cities(sys.argv[1])
