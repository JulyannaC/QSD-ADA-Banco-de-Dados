--UNION, UNION ALL, CONCATENACAO DE STRINGS, VIEWS


--PREPARACAO PARA UNION
create table Bandas (
	banda_id serial primary key,
	nome varchar(100) NOT NULL,
	genero varchar(50),
);

create table Palcos (
	nome serial primary key,
	nome varchar(100),
	capacidade int
);

-- Inserindo dados em Bandas
INSERT INTO Bandas (banda_id, Nome, Genero) VALUES (1, 'The Eternal Watchers', 'Rock');
INSERT INTO Bandas (banda_id, Nome, Genero) VALUES (2, 'Quiet Corners', 'Jazz');
INSERT INTO Bandas (banda_id, Nome, Genero) VALUES (3, 'Sonic Boom', 'Eletrônica');

-- Inserindo dados em Palcos
INSERT INTO Palcos (palco_id, Nome, Capacidade) VALUES (1, 'Main Stage', 10000);
INSERT INTO Palcos (palco_id, Nome, Capacidade) VALUES (2, 'Jazz Corner', 3000);
INSERT INTO Palcos (palco_id, Nome, Capacidade) VALUES (3, 'Main Stage', 10000);  -- Duplicata intencional para demonstração

alter table Palcos add paralelepipedo varchar(100);

update Palcos set paralelepipedo=nome || ' ' || capacidade;
--Este comando está atualizando a tabela ‘Palcos’. 
--Ele está definindo o valor da coluna ‘paralelepipedo’ para ser uma concatenação do valor da coluna ‘nome’,
-- um espaço em branco e o valor da coluna ‘capacidade’.

select count(*) from Palcos where nome = 'Main Stage';
--Este comando está contando o número de linhas na tabela ‘Palcos’ 
--onde o valor da coluna ‘nome’ é igual a ‘Main Stage’.

select distinct nome from Palcos where nome = 'Main Stage';
--Este comando está selecionando todos os valores distintos da coluna ‘nome’ na tabela ‘Palcos’ 
--onde o valor da coluna ‘nome’ é igual a ‘Main Stage’.

select * from palcos p;

select nome from bandas
union
select nome from Palcos;
--Este comando está selecionando a coluna ‘nome’ da tabela ‘bandas’ e da tabela ‘Palcos’. 
--A palavra-chave ‘union’ é usada para combinar as linhas de duas ou mais consultas 
--em um único conjunto de resultados. 
-- A ‘union’ remove automaticamente as linhas duplicadas.

select NOME from Palcos
union all
select Genero from bandas;
--Este comando é semelhante ao anterior, mas usa ‘union all’ em vez de ‘union’. 
--A diferença é que ‘union all’ não remove as linhas duplicadas. 
--Ele está selecionando a coluna ‘NOME’ da tabela ‘Palcos’ e a coluna ‘Genero’ da tabela ‘bandas’.


-- CONTATENACOES DE VALORES

select 'Hello, ' || 'World!' as greetings;
--Este comando está concatenando duas strings, 'Hello, ’ e ‘World!’, 
-- e o resultado ‘Hello, World!’ é selecionado como uma coluna temporária chamada ‘greetings’. 
--Portanto, o resultado dessa consulta será uma única linha com uma única coluna ‘greetings’ 
--contendo o texto ‘Hello, World!’.

alter table Palcos drop paralelepipedo;
--Este comando está removendo a coluna ‘paralelepipedo’ da tabela ‘Palcos’. 
-- Depois que este comando for executado, a coluna ‘paralelepipedo’ não existirá mais na tabela ‘Palcos’.

alter table Bandas add vocalista varchar(100);
alter table Bandas add baterista varchar(100);
select * from Bandas;
update bandas set vocalista='Bastiao',baterista='Donato' where banda_id=1;
update bandas set vocalista='Firmino' where banda_id=2;
update bandas set baterista='Adamastor' where banda_id=3;


select * FROM bandas;
-- para caso o valor seja nulo
SELECT baterista || ' ' || vocalista AS integrantes FROM bandas;
--Este comando SQL está selecionando e concatenando os valores das colunas ‘baterista’ e ‘vocalista’ 
--da tabela ‘bandas’. A concatenação é feita com um espaço entre os dois valores. 
--O resultado é uma coluna temporária chamada ‘integrantes’.Portanto, para cada linha na tabela ‘bandas’, 
--você terá uma string que é o nome do baterista, seguido por um espaço, seguido pelo nome do vocalista. 
-- Essa string será exibida em uma coluna chamada ‘integrantes’.

--COALESCE(vocalista, 'NAO TEM') => serve para colocar valor default
-- se vocalista for NULL
SELECT coalesce(baterista,'') || ' ' || COALESCE(vocalista, '') AS integrantes
FROM bandas;
-- A  função COALESCE retorna o primeiro valor não nulo na lista de argumentos fornecidos. 
--Portanto, COALESCE(baterista,'') retornará o valor da coluna ‘baterista’ se não for nulo, 
--e uma string vazia ('') se o valor da coluna ‘baterista’ for nulo. O mesmo se aplica a COALESCE(vocalista, '').
-- Portanto, para cada linha na tabela ‘bandas’, você terá uma string que é o nome do baterista 
--(ou uma string vazia se o valor for nulo), seguido por um espaço, seguido pelo nome do vocalista 
-- (ou uma string vazia se o valor for nulo). Essa string será exibida em uma coluna chamada ‘integrantes’.

SELECT baterista || ' E ' || vocalista AS integrantes FROM bandas;
-- Este comando SQL está selecionando e concatenando os valores das colunas ‘baterista’ e ‘vocalista’ da tabela
-- ‘bandas’. A concatenação é feita com a string ’ E ’ entre os dois valores. 
--O resultado é uma coluna temporária chamada ‘integrantes’.Portanto, para cada linha na tabela ‘bandas’, 
--você terá uma string que é o nome do baterista, seguido por ’ E ', seguido pelo nome do vocalista. 
--Essa string será exibida em uma coluna chamada ‘integrantes’.

SELECT concat(baterista , ' E ' , vocalista) AS integrantes FROM bandas;
-- função ‘concat’ para concatenar os valores das colunas ‘baterista’ e ‘vocalista’ da tabela ‘bandas’. 
--A concatenação é feita com a string ’ E ’ entre os dois valores. O resultado é uma coluna temporária 
--chamada ‘integrantes’. A função ‘concat’ pega dois ou mais argumentos de string e os concatena 
--em um único valor de string. Portanto, concat(baterista , ' E ' , vocalista) retornará uma string 
--que é o nome do baterista, seguido por ’ E ', seguido pelo nome do vocalista.
-- Portanto, para cada linha na tabela ‘bandas’, você terá uma string que é o nome do baterista, 
--seguido por ’ E ', seguido pelo nome do vocalista. Essa string será exibida em uma coluna chamada ‘integrantes’.

SELECT concat(
	coalesce(baterista,'SEM BATERISTA'), 
	' E ', 
	coalesce(vocalista,'SEM VOCALISTA')) AS integrantes 
from bandas;

--A função ‘coalesce’ retorna o primeiro valor não nulo na lista de argumentos fornecidos. 
--Portanto, coalesce(baterista,'SEM BATERISTA') retornará o valor da coluna ‘baterista’ se não for nulo, 
-- e a string ‘SEM BATERISTA’ se o valor da coluna ‘baterista’ for nulo. 
--O mesmo se aplica a coalesce(vocalista,'SEM VOCALISTA').
--Portanto, para cada linha na tabela ‘bandas’, você terá uma string que é o nome do baterista 
--(ou ‘SEM BATERISTA’ se o valor for nulo), seguido por ’ E ', 
--seguido pelo nome do vocalista (ou ‘SEM VOCALISTA’ se o valor for nulo). 
--Essa string será exibida em uma coluna chamada ‘integrantes’.


select * FROM bandas;

select concat(baterista,vocalista,nome) integrantes FROM bandas;
-- Este comando está usando a função ‘concat’ para concatenar os valores das colunas ‘baterista’, ‘vocalista’ 
-- e ‘nome’ da tabela ‘bandas’. O resultado é uma coluna temporária chamada ‘integrantes’.
-- Portanto, para cada linha na tabela ‘bandas’, você terá uma string que é o nome do baterista, 
--seguido pelo nome do vocalista, seguido pelo nome da banda. 
--Essa string será exibida em uma coluna chamada ‘integrantes’.


-- VIEWS
-- ELIMINAR TABELAS BANDAS PALCOS SHOWS
-- RECRIAR USANDO SQL DA AULA 3
create view Detalhes_Shows as
select 
	b.nome as "Nome da Banda",
	p.nome as "Nome do Palco",
	concat(s.data ,' - ',s.hora) "Data e Hora",
	s.preco 
from 
	shows s
inner join
	Bandas b on s.banda_id = b.banda_id 
inner join
	palcos p on s.palco_id = p.palco_id;

-- create view Detalhes_Shows as: Este comando cria uma nova view chamada ‘Detalhes_Shows’.

-- A consulta select a seguir define o conteúdo da view. Ela seleciona várias colunas de várias tabelas:
-- b.nome as "Nome da Banda": Isso seleciona a coluna ‘nome’ da tabela ‘Bandas’ (alias ‘b’) 
--e a renomeia para “Nome da Banda” na view.

-- p.nome as "Nome do Palco": Isso seleciona a coluna ‘nome’ da tabela ‘palcos’ (alias ‘p’) 
--e a renomeia para “Nome do Palco” na view.

-- concat(s.data ,' - ',s.hora) "Data e Hora": Isso concatena a coluna ‘data’, um hífen e a coluna ‘hora’ da tabela
-- ‘shows’ (alias ‘s’) e nomeia a coluna resultante como “Data e Hora” na view.

-- s.preco: Isso seleciona a coluna ‘preco’ da tabela ‘shows’.

-- A cláusula from especifica a tabela principal ‘shows’ (alias ‘s’) da qual os dados são selecionados.

-- As cláusulas inner join combinam linhas de ‘Bandas’ e ‘palcos’ com ‘shows’ 
--onde os valores da coluna ‘banda_id’ e ‘palco_id’ são iguais, respectivamente.
	

select * from Detalhes_Shows;

create view capacidade_3000_palcos as
select nome, capacidade
from
palcos p where capacidade > 3000;

select * from capacidade_3000_palcos;
insert into Palcos values (3, 'Palco Deivisson',10000);

create or replace view capacidade_3000_palcos as
select 
	nome,
	capacidade,
	(Capacidade / 1000) as "Capacidade em Milhares"
from
palcos p where
	capacidade > 3000;

--Este comando está criando ou substituindo uma view chamada ‘capacidade_3000_palcos’. 
--A view é definida pela consulta select que seleciona as colunas ‘nome’, ‘capacidade’ e ‘(Capacidade / 1000) 
--as “Capacidade em Milhares”’ da tabela ‘palcos’ (alias ‘p’) onde a ‘capacidade’ é maior que 3000.
-- Portanto, a view ‘capacidade_3000_palcos’ conterá o nome, a capacidade e a capacidade em milhares
--(calculada como capacidade dividida por 1000) para todos os palcos com capacidade maior que 3000.

drop view if exists capacidade_3000_palcos;

-- Este comando está removendo a view ‘capacidade_3000_palcos’ se ela existir. 
--Depois que este comando for executado, a view ‘capacidade_3000_palcos’ não existirá mais.