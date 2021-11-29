import configparser


def get_config():
    config = configparser.ConfigParser()
    config.read('config.ini')
    print("mysql")
    print("port: ", [config["mysql"].get("port", "1234")])
    print("pg port: ", [config["postgresql"].getint("port")])

    config["mysql"]["port"] = "3366"
    with open("config.ini", "wt") as file:
        config.write(file)


if __name__ == '__main__':
    get_config()
