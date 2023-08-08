-- authors
CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY(id)
);

-- games
CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE NOT NULL,
    games_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_authors FOREIGN KEY(games_id) REFERENCES authors(id)
);
