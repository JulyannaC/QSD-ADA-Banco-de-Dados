--Banco de dados seguindo o projeto em java do módulo anterior (escola)

CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    turma VARCHAR(50),
    atividade TEXT
);

-- Inserções
INSERT INTO alunos (nome, matricula, turma, atividade)
VALUES ('João Lima', '2021001', 'Turma A', 'Estudando Matemática');


INSERT INTO alunos (nome, matricula, turma, atividade)
VALUES ('Felipe Andrade', '2021002', 'Turma B', 'Fazendo Pesquisa');


INSERT INTO alunos (nome, matricula, turma, atividade)
VALUES ('Pedro Soares', '2021003', 'Turma A', 'Preparando Apresentação');

select * from alunos;

-------------------------------------------------------------------------

CREATE TABLE professores (
    id_professor SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    atividade TEXT
);

--Inserções

INSERT INTO professores (email, cpf, nome, atividade)
VALUES ('prof.julia@email.com', '123.456.789-01', 'Julia Rodrigues', 'Ministrando Aulas');


INSERT INTO professores (email, cpf, nome, atividade)
VALUES ('prof.carlos@email.com', '987.654.321-02', 'Carlos Mendes', 'Orientando Projetos');


INSERT INTO professores (email, cpf, nome, atividade)
VALUES ('prof.ana@email.com', '555.555.555-03', 'Ana Leal', 'Coordenando Eventos');

select * from professores;

-- CONCAT e COALESCE na seleção de alunos
SELECT 
    id_aluno, 
    CONCAT(nome, ' - ', COALESCE(turma, 'Sem turma'), ' - ', COALESCE(atividade, 'Sem atividade')) AS detalhes_aluno
FROM 
    alunos;

-- CONCAT e COALESCE na seleção de professores
SELECT 
    id_professor, 
    CONCAT(nome, ' - ', COALESCE(atividade, 'Sem atividade')) AS detalhes_professor
FROM 
    professores;

-- Exemplo de UNION para combinar nomes de alunos e professores
SELECT nome, 'Aluno' AS tipo_classe FROM alunos
UNION
SELECT nome, 'Professor' AS tipo_classe FROM professores;

-- Exemplo de UNION ALL para listar todas as atividades de alunos e professores
SELECT atividade FROM alunos
UNION ALL
SELECT atividade FROM professores;




