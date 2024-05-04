--Criação das tabelas

CREATE TABLE Bandas (
                        Id SERIAL PRIMARY KEY,
                        Nome VARCHAR(100),
                        Genero VARCHAR(50),
                        Pais VARCHAR(50)
);

CREATE TABLE Palcos (
                        Id SERIAL PRIMARY KEY,
                        Nome VARCHAR(100),
                        Capacidade INT
);

CREATE TABLE Shows (
                        Id SERIAL PRIMARY KEY,
                        Id_Banda INT,
                        Id_Palco INT,
                        Data DATE,
                        Hora TIME,
                        Preco DECIMAL(10, 2),
                        FOREIGN KEY (Id_Banda) REFERENCES Bandas(Id),
                        FOREIGN KEY (Id_Palco) REFERENCES Palcos(Id)
);

--Inserção e leitura dos dados 

INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('The Cosmic Keys', 'Rock', 'EUA');
INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('Electro Harmonix', 'Eletrônica', 'França');
INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('Jazz & Java', 'Jazz', 'Brasil');

INSERT INTO Palcos (Nome, Capacidade) VALUES ('Palco Solar', 5000);
INSERT INTO Palcos (Nome, Capacidade) VALUES ('Palco Lunar', 3000);

INSERT INTO Shows (Id_Banda, Id_Palco, Data, Hora, Preco) VALUES (1, 1, '2024-07-15', '20:00', 50.00);
INSERT INTO Shows (Id_Banda, Id_Palco, Data, Hora, Preco) VALUES (2, 2, '2024-07-15', '22:00', 40.00);
INSERT INTO Shows (Id_Banda, Id_Palco, Data, Hora, Preco) VALUES (3, 1, '2024-07-16', '18:00', 30.00);

select * from Bandas;
select * from Palcos;
select * from Shows;

--Alteração na tabela

alter table shows alter column data type date using data ::date;

--EXERCÍCIO


--Alterar tabela
--Adicione uma coluna chamada AnoFormacao do tipo integer à tabela Bandas. 
--Essa coluna vai armazenar o ano em que a banda foi formada.

alter table bandas add column ano_formacao int;

--Inserir Dados nas Tabelas
--Insira dados para uma nova banda chamada "Folk Fiddles", um grupo de folk americano formado em 2015. 
--Insira essa banda como originária dos EUA.

INSERT INTO Bandas (Nome, Genero, Pais, Ano_Formacao) VALUES ('Folk Fiddles', 'Folk Americano', 'EUA', 2015);

--Adicione um novo palco chamado "Palco Acústico" com capacidade para 1500 pessoas.

insert into Palcos (nome, capacidade) values ('Palco Acústico', 1500);

--Atualizar Informações
--A banda "Jazz & Java" decidiu mudar seu nome para "Jazz Fusion". Atualize o nome dela na tabela Bandas.

update bandas set nome = 'Jazz Fusion' where nome = 'Jazz & Java';

--O preço dos ingressos para os shows no "Palco Solar" deve ser aumentado em 10%. 

update shows set preco= preco * 1.1 where id_palco = 1;

--Suponha que os preços originais variam. Aumentar em 10% o preco de todos os shows
update shows set preco = preco * 1.1;

--Deletar Dados
--Suponha que o "Palco Lunar" será fechado para reformas, e todos os shows planejados para esse palco 
--precisam ser cancelados. Delete esses shows da tabela Shows.
delete from shows where id_palco=2;


----------------------------

--Bandas
--???
--
--Palcos
--???
--
--Show
--???

-- DDL (Data Definition Language)
-- CREATE table
-- DROP -> REMOVER TABELA
-- ALTER table -> altera TABELA

-- DML (Data Manipulation Language)
-- INSERT
-- update => atualiza DADOS
-- DELETE
-- SELECT


alter table bandas add column BATERISTA VARCHAR(100);

-- num_integrantes maior 4
-- num_integrantes e menor ou igual a 5
-- Igor
-- Vocalista de Rock = Guilherme
-- Vocalista de Jazz = Gabi X
-- Vocalista de Eletronica = Isa

-- de uma banda que tem Cosmic

-- Usar like com cuidado. Nao eh performatico
-- like '%Cosmic%'

update bandas set vocalista='Guilherme' where nome like '%Cosmic%';

update bandas set BATERISTA='Igor'
	where num_integrantes <= 5;

select * from bandas;
select * from palcos;


create table Shows (
	nome VARCHAR(100)
)


create table bandas(
	banda_id integer primary key,
	nome varchar(50),
	genero_musical varchar(30),
	num_integrantes int,
	pais varchar(20)
);



create table palcos(
	palco_id int primary key,
	nome_palco varchar(20),
	capacidade int
);

insert into bandas values 
(1, 'The Cosmic Keys', 'Rock', 6, 'EUA'),
(2, 'Electro Harmonix', 'Eletrônica', 5, 'França'),
(3, 'Jazz & Show', 'Jazz', 4, 'Brasil');


insert into palcos values
(1, 'Palco Solar', 5000),
(2, 'Palco Lunar', 3000);

select * from SHOWS;
drop table shows;
select * from bandas;

alter table SHOWS add column show_id integer;
alter table SHOWS add primary KEY (show_id);

update bandas set baterista=null;
select * from bandas;

alter table SHOWS rename column show_id to id;

-- deleter chave primaria
alter table SHOWS drop constraint shows_pkey;

alter table SHOWS alter column data type date USING data::date;

alter table SHOWS add column if not exists abcd varchar;
alter table SHOWS drop column if exists abcd;

alter table bandas alter column baterista set default 'SEM BATERISTA';
alter table bandas alter column baterista drop default;

-- flightway
-- liquibase

insert into bandas (banda_id, nome) values (5, 'Ramones');
select * from bandas;
-- id = estrutura de hash

--
--Bandas
--Id
--Nome
--Gênero
--País
--
--Palcos
--Id
--Nome
--Capacidade
--
--Show
--Id
--Id_Banda
--Id_Palco
--Data
--Hora
--Preço

--------DADOS FESTIVAL

INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('The Cosmic Keys', 'Rock', 'EUA');
INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('Electro Harmonix', 'Eletrônica', 'França');
INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('Jazz & Show', 'Jazz', 'Brasil');

INSERT INTO Palcos (Nome, Capacidade) VALUES ('Palco Solar', 5000);
INSERT INTO Palcos (Nome, Capacidade) VALUES ('Palco Lunar', 3000);

INSERT INTO Shows (banda_id, Palco_id, Data, Hora, Preco) VALUES (1, 1, '2024-07-15', '20:00', 50.00);
INSERT INTO Shows (banda_id, Palco_id, Data, Hora, Preco) VALUES (2, 2, '2024-07-15', '22:00', 40.00);
INSERT INTO Shows (banda_id, Palco_id, Data, Hora, Preco) VALUES (3, 1, '2024-07-16', '18:00', 30.00);

CREATE TABLE Bandas (
                        banda_id SERIAL PRIMARY KEY,
                        Nome VARCHAR(100),
                        Genero VARCHAR(50),
                        Pais VARCHAR(50)
);

CREATE TABLE Palcos (
                        palco_id SERIAL PRIMARY KEY,
                        Nome VARCHAR(100),
                        Capacidade INT
);

CREATE TABLE Shows (
                        show_id SERIAL PRIMARY KEY,
                        banda_id INT,
                        palco_id INT,
                        Data DATE,
                        Hora TIME,
                        Preco DECIMAL(10, 2),
                        FOREIGN KEY (banda_id) REFERENCES Bandas(banda_id),
                        FOREIGN KEY (palco_id) REFERENCES Palcos(palco_id)
    );