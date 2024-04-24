1. No query, você usa:
- o insert into nome_da_tabela values
(1, 'portugues', 'literatura e gramatica');

2. Inserindo mais de um dado:

insert into disciplinas values
(2, 'matematica', 'algebra e geometria'),
(3, 'fisica', 'cinematica e dinamica');

3. Importar dados de um csv:

copy disciplinas (id_disciplina, nome, ementa)
from 'C:\disciplinas.csv'
delimiter ','
csv header (ignora a primeira linha)
