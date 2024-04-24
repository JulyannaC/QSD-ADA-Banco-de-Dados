-- CREATE

create table bandas(
	nome varchar(100),
	genero_musical varchar(30),
	pais varchar(20),
	num_integrante int
)

create table palcos(
	nome varchar(100),
	capacidade int
)

create table shows(
	data_show date,
	hora time,
	valor_ingresso money
)

-- ALTER

alter table bandas add column id int;
alter table bandas add primary key (id);	

alter table bandas add column bateirista varchar(100);

-- UPDATE

update bandas set bateirista='Igor'
	where num_integrante > 3 and num_integrante <= 5;

update bandas set bateirista='Ju'
	where genero_musical='Ska/Reggae';

update bandas set bateirista='Guilherme'
	where nome like '%The%'; 

update bandas set id=6 where nome = 'The Rolling Stones';

-- INSERT AND SELECT

insert into bandas values
	('Kraftwerk', 'Eletrônica', 'Alemanha', 4),
	('The Rolling Stones', 'Rock', 'Reino Unido', 4),
	('ABBA', 'Pop', 'Suécia', 4),
	('Los Fabulosos Cadillacs', 'Ska/Reggae', 'Argentina', 11),
	('Sepultura', 'Heavy Metal', 'Brasil', 4),
	('Jazz & Java', 'Jazz', 'Brasil', 5);
select * from bandas;

insert into palcos values
	('Palco Mundo', 10000),
	('Palco Sunset', 7000),
	('Palco Água', 4000),
	('Palco Lua', 8000);
select * from palcos;	

insert into shows values
	('2024-07-10', '21:30', 'R$ 150,00'),
	('2024-08-15', '20:00', 'R$ 200,00'),
	('2024-09-05', '19:00', 'R$ 120,00'),
	('2024-10-20', '22:00', 'R$ 180,00'),
	('2024-11-12', '18:30', 'R$ 160,00');
select * from shows;