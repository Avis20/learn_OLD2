
from pprint import pprint

# map с использованием lambda
numbers = [2, 3, 6, 6, 5]
map_numbers = list(map(lambda x: x * 2, numbers))

print(numbers)
print(map_numbers)


aquarium_creatures = [
    {"name": "sammy", "species": "shark", "tank number": 11, "type": "fish"},
    {"name": "ashley", "species": "crab", "tank number": 25, "type": "shellfish"},
    {"name": "jo", "species": "guppy", "tank number": 18, "type": "fish"},
    {"name": "jackie", "species": "lobster", "tank number": 21, "type": "shellfish"},
    {"name": "charlie", "species": "clownfish", "tank number": 12, "type": "fish"},
    {"name": "olly", "species": "green turtle", "tank number": 34, "type": "turtle"}
]

# map с пользовательской функцией


def assign_to_tank(aquarium_creatures, new_tank_number):
    def apply(x):
        x["tank number"] = new_tank_number
        return x
    return map(apply, aquarium_creatures)


pprint(aquarium_creatures)
assign = assign_to_tank(aquarium_creatures, 42)
pprint(list(assign))


# map со встроенными функциями

numbers = [1, 2, 3, 4]
powers = [3, 4, 6, 1]

power_numbers = map(pow, numbers, powers)
print(list(power_numbers))
# [1, 16, 729, 4]
