from faker import Faker
faker = Faker()

print(faker.text(max_nb_chars=20))
