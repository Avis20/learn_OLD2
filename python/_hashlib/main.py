import hashlib
import uuid


def hash_password(password: str) -> str:
    salt = uuid.uuid4().hex
    bytes_pass = salt.encode() + password.encode()
    hashed_pass = f"{hashlib.sha256(bytes_pass).hexdigest()}:{salt}"
    return hashed_pass


def check_password(hashed_password: str, user_password: str) -> bool:
    password, salt = hashed_password.split(":")
    bytes_pass = salt.encode() + user_password.encode()
    return password == hashlib.sha256(bytes_pass).hexdigest()


if __name__ == "__main__":
    new_pass = input("Введите пароль: ")
    hashed_password = hash_password(new_pass)
    print(f"Строка в БД: {hashed_password}")

    next_try_password = input("Введите пароль еще раз: ")
    if check_password(hashed_password, next_try_password):
        print("Пароли совпадают")
    else:
        print("Пароли не совпадают")
