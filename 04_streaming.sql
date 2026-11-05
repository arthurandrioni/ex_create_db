CREATE DATABASE streaming_service;


CREATE TABLE planos (
    id_plano SERIAL PRIMARY KEY,
    preco DECIMAL (8,2) NOT NULL,
        CONSTRAINT valid_price
            CHECK(preco > 0)

);


CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    email VARCHAR(80),
    id_plano INTEGER NOT NULL,
        CONSTRAINT fk_usuario_plano
            FOREIGN KEY (id_plano)
            REFERENCES planos(id_plano)
);


CREATE TABLE generos (
    id_genero SERIAL PRIMARY KEY,
    nome VARCHAR(80)
);


CREATE TABLE diretores (
    id_diretor SERIAL PRIMARY KEY,
    nome VARCHAR(80)
);


CREATE TABLE filmes (
    id_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(80),
    ano INTEGER,
    id_genero INTEGER NOT NULL,
    id_diretor INTEGER NOT NULL,
        CONSTRAINT fk_filmes_genero
            FOREIGN KEY(id_genero)
            REFERENCES generos(id_genero),
        CONSTRAINT fk_filme_diretor
            FOREIGN KEY (id_diretor)
            REFERENCES diretores(id_diretor)

);


CREATE TABLE assistidos (
    id_usuario INTEGER NOT NULL,
    id_filme INTEGER NOT NULL,
        CONSTRAINT pk_usuario_filme
            PRIMARY KEY (id_usuario, id_filme),
        CONSTRAINT fk_assistidos_usuario
            FOREIGN KEY (id_usuario)
            REFERENCES usuarios(id_usuario),
        CONSTRAINT fk_assistidos_filme
            FOREIGN KEY (id_filme)
            REFERENCES filmes(id_filme)
);
