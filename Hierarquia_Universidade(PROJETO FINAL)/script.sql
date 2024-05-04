-- PROJETO FINAL: HIERARQUIA_UNIVERSIDADE

--Criação das tabelas

CREATE TABLE Pessoa (
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Aluno (
    matricula INT PRIMARY KEY REFERENCES Pessoa(matricula),
    mensalidade DECIMAL(10, 2)
);

CREATE TABLE Professor (
    matricula INT PRIMARY KEY REFERENCES Pessoa(matricula),
    salario DECIMAL(10, 2),
    formacao VARCHAR(100)
);

CREATE TABLE Funcionario (
    matricula INT PRIMARY KEY REFERENCES Pessoa(matricula),
    salario DECIMAL(10, 2),
    funcao VARCHAR(100)
);

CREATE TABLE UnidadeAcademica (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Contratado (
    matricula INT PRIMARY KEY REFERENCES Pessoa(matricula),
    data_inicio DATE,
    unidade_academica INT REFERENCES UnidadeAcademica(codigo)
);

CREATE TABLE Dependente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    contratado INT REFERENCES Contratado(matricula),
    parentesco VARCHAR (100)
);

CREATE TABLE Disciplina (
    codcred SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Turma (
    numero SERIAL PRIMARY KEY,
    horario TIME,
    disciplina INT REFERENCES Disciplina(codcred),
    nome_disciplina VARCHAR(100) REFERENCES Disciplina(nome),
    professor INT REFERENCES Professor(matricula)
);

CREATE TABLE Aluno_Turma (
    aluno INT REFERENCES Aluno(matricula),
    turma INT REFERENCES Turma(numero),
    semestre VARCHAR(10),
    PRIMARY KEY (aluno, turma, semestre)
);

select * from Aluno_Turma;

--INSERÇÃO DOS DADOS

insert into Pessoa (matricula, nome, email) VALUES
(1, 'João Silva', 'joao@example.com'),
(2, 'Maria Souza', 'maria@example.com'),
(3, 'Pedro Santos', 'pedro@example.com'),
(4, 'Ana Oliveira', 'ana@example.com'),
(5, 'Carlos Rodrigues', 'carlos@example.com'),
(6, 'Fernanda Costa', 'fernanda@example.com'),
(7, 'Ricardo Almeida', 'ricardo@example.com'),
(8, 'Amanda Pereira', 'amanda@example.com'),
(9, 'Lucas Ferreira', 'lucas@example.com'),
(10, 'Juliana Oliveira', 'juliana@example.com'),
(11, 'Gustavo Santos', 'gustavo@example.com'),
(12, 'Marina Silva', 'marina@example.com');


INSERT INTO Aluno (matricula, mensalidade) VALUES
(1, 500.00),
(2, 550.00),
(3, 520.00),
(4, 530.00);

INSERT INTO Professor (matricula, salario, formacao) VALUES
(5, 3000.00, 'Doutorado em Química'),
(6, 2600.00, 'Mestrado em Física'),
(7, 2000.00, 'Graduação em Matemática'),
(8, 3000.00, 'Doutorado em Biologia');

INSERT INTO Funcionario (matricula, salario, funcao) VALUES
(9, 2100.00, 'Secretário'),
(10, 1800.00, 'Técnico'),
(11, 1980.00, 'Administrativo'),
(12, 1000.00, 'Limpeza');

INSERT INTO UnidadeAcademica (codigo, nome) VALUES
(1, 'Universidade Federal da Paraíba-Campus I'),
(2, 'Universidade Federal da Paraíba-Campus II'),
(3, 'Universidade Federal da Paraíba-Campus III'),
(4, 'Universidade Federal da Paraíba-Campus IV');

INSERT INTO Contratado (matricula, data_inicio, unidade_academica) VALUES
(5, '2023-01-01', 1),
(6, '2022-06-15', 2),
(7, '2023-03-20', 3),
(8, '2022-09-10', 4),
(9, '2023-01-01', 4),
(10, '2022-06-15', 2),
(11, '2023-03-20', 3),
(12, '2022-09-10', 1);

INSERT INTO Dependente (id, nome, contratado, parentesco) VALUES
(1, 'Luis', 5, 'filho'),
(2, 'Felipe', 5, 'pai'),
(3, 'Henrique', 6, 'filho'),
(4, 'Jaqueline', 7, 'filha');

INSERT INTO Disciplina (codcred, nome) VALUES
(1, 'Estrutura Atômica'),
(2, 'Cinemática'),
(3, 'Cálculo III'),
(4, 'Biologia Celular');

INSERT INTO Turma (numero, horario, disciplina, nome_disciplina, professor) VALUES
(1, '08:00:00', 1, 'Estrutura Atômica', 5),
(2, '10:00:00', 2, 'Cinemática', 6),
(3, '13:00:00', 3, 'Cálculo III', 7),
(4, '15:00:00', 4, 'Biologia Celular', 8);

INSERT INTO Aluno_Turma (aluno, turma, semestre) VALUES
(1, 1, '2023/1'),
(2, 2, '2023/1'),
(3, 3, '2023/1'),
(4, 4, '2023/1');

-- Tabela construída a partir da junção das tabelas Aluno, Professor e Funcionario com base na tabela Pessoa.

SELECT 
    p.nome, 
    p.email, 
    p.matricula,
    CASE 
        WHEN a.matricula IS NOT NULL THEN 'Aluno'
        WHEN pr.matricula IS NOT NULL THEN 'Professor'
        WHEN f.matricula IS NOT NULL THEN 'Funcionario'
        ELSE 'Desconhecido' 
    END AS tipo
FROM Pessoa p
LEFT JOIN Aluno a ON p.matricula = a.matricula
LEFT JOIN Professor pr ON p.matricula = pr.matricula
LEFT JOIN Funcionario f ON p.matricula = f.matricula
ORDER BY p.matricula;

--Tabela completa com todas as pessoas e seus respectivos salários e mensalidades.

SELECT 
    p.nome, 
    p.email, 
    p.matricula,
    CASE 
        WHEN a.matricula IS NOT NULL THEN 'Aluno'
        WHEN pr.matricula IS NOT NULL THEN 'Professor'
        WHEN f.matricula IS NOT NULL THEN 'Funcionario'
        ELSE 'Desconhecido' 
    END AS tipo,
    CASE 
        WHEN a.matricula IS NOT NULL THEN COALESCE(CAST(a.mensalidade AS TEXT), '-')
        ELSE '-'
    END AS mensalidade,
    CASE 
        WHEN pr.matricula IS NOT NULL THEN COALESCE(CAST(pr.salario AS TEXT), '-')
        ELSE '-'
    END AS salario_professor,
    CASE 
        WHEN f.matricula IS NOT NULL THEN COALESCE(CAST(f.salario AS TEXT), '-')
        ELSE '-'
    END AS salario_funcionario
FROM Pessoa p
LEFT JOIN Aluno a ON p.matricula = a.matricula
LEFT JOIN Professor pr ON p.matricula = pr.matricula
LEFT JOIN Funcionario f ON p.matricula = f.matricula
ORDER BY p.matricula;




















