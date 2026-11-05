CREATE DATABASE escola_idiomas;


CREATE TABLE disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);


CREATE TABLE professores (
    CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);




CREATE TABLE turmas (
    id_turma SERIAL PRIMARY KEY,
    sala VARCHAR(20),
    cpf_prof CHAR(11) NOT NULL,
    id_disciplina INTEGER NOT NULL,
        CONSTRAINT fk_turmas_prof
            FOREIGN KEY (cpf_prof)
            REFERENCES professores(cpf),
        CONSTRAINT fk_turma_disciplina
            FOREIGN KEY (id_disciplina)
            REFERENCES disciplinas(id_disciplina)
);




CREATE TABLE alunos (
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    id_turma INTEGER NOT NULL,
        CONSTRAINT turma_alunos
            FOREIGN KEY (id_turma)
            REFERENCES turmas(id_turma)
            
);