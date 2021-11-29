import csv

def write_csv_file(filename):
    FIELD_NAME = "name"
    FIELD_ARTIST = "artist"
    FIELD_YEAR = "year"
    fieldnames = [FIELD_NAME, FIELD_ARTIST, FIELD_YEAR]

    with open(filename, "wt") as file:
        csv_writer = csv.DictWriter(
            f=file,
            fieldnames=fieldnames,
            # delimiter=",", # default
            # quotechar='"', # default
            quoting=csv.QUOTE_ALL,
        )
        csv_writer.writeheader()
        csv_writer.writerow({
            FIELD_NAME: "Megalovania",
            FIELD_ARTIST: "RichaadEB, ThunderScott",
            FIELD_YEAR: 2019
        })
        csv_writer.writerow({
            FIELD_NAME: "High Diving",
            FIELD_ARTIST: "A Day To Remember",
            FIELD_YEAR: 2021
        })


def read_csv_file(filename):
    with open(filename, "r") as file:
        csv_reader = csv.DictReader(file, delimiter=",")
        for row in csv_reader:
            print(row)


if __name__ == '__main__':
    file_name = "music.csv"
    write_csv_file(file_name)
    read_csv_file(file_name)

'''
import csv


def read_csv_file_as_dict():
    with open("cars.csv", "r") as file:
        csv_reader = csv.DictReader(file, delimiter=",")
        lines_counter = 0
        for row in csv_reader:
            if lines_counter == 0:
                print("Колонки:", " | ".join(row))
            print(f"Производитель=[{row['vendor']}], Марка=[{row['name']}]; Цена=[{row['price']}]")
            lines_counter += 1
        print("Кол-во строк =", lines_counter)


if __name__ == '__main__':
    read_csv_file_as_dict()
'''

'''
import csv


def read_csv_file():
    with open("cars.csv") as file:
        csv_reader = csv.reader(file, delimiter=",")
        lines_count = 0
        for row in csv_reader:
            if lines_count == 0:
                print("Колонки:", " | ".join(row))
            else:
                print(f"Производитель=[{row[1]}], Марка=[{row[2]}]; Цена=[{row[4]}]")
            lines_count += 1
        print("Кол-во строк =", lines_count)


if __name__ == '__main__':
    read_csv_file()
'''