
-- CREATE DATABASE local_db;
-- DROP DATABASE local_db WITH(FORCE);

-- drop table films;

CREATE TABLE films (
    film_id SERIAL NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    length INTEGER,
    rating NUMERIC(2, 1),
    PRIMARY KEY(film_id)
);

COMMENT ON COLUMN films.film_id IS 'ID фильма';
COMMENT ON COLUMN films.name IS 'Название фильма';
COMMENT ON COLUMN films.description IS 'Описание фильма';
COMMENT ON COLUMN films.length IS 'Длительность фильма (в мин.)';
COMMENT ON COLUMN films.rating IS 'Рейтинг фильма';

INSERT INTO films ("name", "description", "length", "rating")
VALUES (
    'Побег из Шоушенка',
    'Несправедливо осужденный банкир готовит побег из тюрьмы. Тим Роббинс в выдающейся экранизации Стивена Кинга',
    142,
    1.1
);

-- drop table categories;

CREATE TABLE categories (
    category_id SERIAL NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY(category_id)
);

COMMENT ON COLUMN categories.category_id IS 'ID категории';
COMMENT ON COLUMN categories.name IS 'Название категории';

insert into categories ("name") values
    ('драма'),
    ('комедия');


-- drop table film_category;

create table film_category (
    film_id INTEGER,
    category_id INTEGER,
    constraint fk_film foreign key (film_id) references films(film_id),
    constraint fk_category foreign key (category_id) references categories(category_id),
    primary key (film_id, category_id)
);

insert into film_category ("film_id", "category_id") values
    (1, 1),
    (1, 2);