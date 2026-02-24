CREATE TABLE IF NOT EXISTS reader (
    reader_id   SERIAL PRIMARY KEY,
    first_name  VARCHAR(255) NOT NULL,
    second_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    adress      VARCHAR(500)
);
CREATE TABLE IF NOT EXISTS book (
    book_id          SERIAL PRIMARY KEY,
    book_name        VARCHAR(500) NOT NULL,
    authors          VARCHAR(500),
    isbn             VARCHAR(20),
    publishing_house VARCHAR(255),
    publishing_year  VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS book_copy (
    copy_id   SERIAL PRIMARY KEY,
    book_id   INTEGER NOT NULL REFERENCES book (book_id) ON DELETE CASCADE,
    status    VARCHAR(20) NOT NULL CHECK (status IN ('taken', 'avaliable', 'lost')),
    condition VARCHAR(20) NOT NULL CHECK (condition IN ('new', 'used', 'bad condition'))
);

CREATE TABLE IF NOT EXISTS book_lend (
    lend_id   SERIAL PRIMARY KEY,
    reader_id INTEGER NOT NULL REFERENCES reader (reader_id) ON DELETE CASCADE,
    book_id   INTEGER NOT NULL REFERENCES book (book_id) ON DELETE CASCADE,
    status    VARCHAR(20) NOT NULL CHECK (status IN ('taken', 'returned', 'lost')),
    date      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
