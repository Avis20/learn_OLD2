from time import sleep

class Teapod():
    def __init__(self, name):
        self.name = name
        if self.name == 'газовый':
            self.type = "л."
        else:
            self.type = "кв/ч"

    def teapod_run(self, time_start):
        print("Чайник " + self.name + " кипит")
        sleep(time_start)
        print("Чайник закипел")
        print("Выключи меня!!!")
        print("Я потратил ", time_start, self.type)


teapod_gas = Teapod("газовый")
teapod_gas.teapod_run(2)
