import psycopg2

conn = psycopg2.connect(
    host="localhost",
    port=5432,
    user="postgres",
    password="1234",
    dbname="local_db",
)

# получаем курсор
cur = conn.cursor()

cur.execute("""
   select *
   from users
   where user_name is not null; 
""")

# выводим каждую строку с новой строки
# должно вернуться тьюпл
for row in cur.fetchall():
    print(row)
