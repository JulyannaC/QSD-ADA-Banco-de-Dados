No security no postgres, você pode adicionar os "privilegios" de quem pode selecionar, atualizar, inserir, etc coisas na tabela (proteger dados sensíveis);

- Como criar uma view (proteger dados sensíveis):

create view nome_da_view as
(
    select 
        nome_das_colunas,
        ...
    from matricula
)

No banco vai ser criar uma pasta chamada views. Você pode acessar da mesma forma que em uma tabela: select* from..