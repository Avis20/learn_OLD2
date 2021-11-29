
import psycopg2

DB_USER = 'postgres'
DB_PASSWORD = '1234'
DB_HOST = 'localhost'
DB_PORT = 5432
DB_NAME = 'local_db'

connect_url = f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

conn = psycopg2.connect(connect_url)

cursor = conn.cursor()


def select_all_films():
    cursor.execute('select * from films')
    return cursor.fetchall()


def select_films_with_categories():
    cursor.execute(
        '''
            SELECT f.*, string_agg(c.name, ', ')
            FROM films as f
            LEFT JOIN film_category as pfc ON pfc.film_id = f.film_id
            LEFT JOIN categories as c on c.category_id = pfc.category_id
            GROUP BY f.film_id
        '''
    )
    return cursor.fetchall()


if __name__ == '__main__':
    # print(select_all_films())
    print(select_films_with_categories())
