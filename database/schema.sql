DROP TABLE IF EXISTS livros;

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    genero TEXT,
    paginas INTEGER,
    nota REAL,
    concluido TEXT,
    emprestado INTEGER
);
