-- DROP -> remover tabela

--drop table bandas;
 -- delete apaga o conteúdo da tabela

--begin

-- end
-- commit

- row back

create table bandas(
	id integer primary key,
	nome varchar(50),
	genero_musical varchar(30),
	num_integrantes int,
	pais varchar(20)
);

create table palcos(
    id_palco int primary key,
    nome_palco varchar(20),
    capacidade int
);

insert into bandas values
(1, '', '', ''),
(2, '', '', ''),
(3, '', '', '');

--alter table => altera tabela
alter table bandas add column id integer;

--update => atualiza dados
update bandas set baterista = 'Roger Taylor' where num_integrantes > 5;

update bandas set vocalista = 'Roger Taylor' where pais = 'Brasil';

update bandas set vocalista = 'Guilherme' where nome like '%Keys'; (quando a palavra ta no final)

(quando a palavra ta no meio %Cosmic%)

alter table shows rename column id_shows to id;

alter table BANDAS add primary KEY (id);

update bandas set id=4 where nome = 'Legião Urbana';

--deleter chave primaria
alter table show drop constraint shows_pkey;

alter table shows alter column data type date using data ::date;

alter table shows add column if not exists abcd varchar;

alter table show drop column if exists abcd;

alter table bandas alter columns baterista set default 'SEM BATERISTA'

insert into bandas (id, nome) values (4, 'Mamonas Assassinas');

select * from bandas;