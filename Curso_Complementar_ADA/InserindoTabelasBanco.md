1. No postgres --> schemas--> tables --> create --> columns

2. query tool --> create table nome_da_tabela(
    id_professor integer,
    celular varchar (14),
    nome varchar (40),
    id_disciplina integer,
    primary key (id_professor),
    foreign key (coluna dessa tabela)
    references coluna da outra tabela()
)