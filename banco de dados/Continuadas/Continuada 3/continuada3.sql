-- 1. Criar as tabelas no MySQL e executar as instruções relacionadas a seguir.
create database Filmes;
use Filmes;

create table Diretor (
	idDiretor int primary key auto_increment,
    nomeDiretor varchar(45),
    pais varchar(45),
    dataNasc date
);

create table Filmes (
	idFilme int primary key auto_increment,
    nomeFilme varchar(45),
    genero varchar (45),
    fkDiretor int,
    foreign key(fkDiretor) references Diretor(idDiretor)    
)auto_increment = 1000;

create table Ator(
	idAtor int primary key auto_increment,
    nomeAtor varchar(45)
) auto_increment = 100;

create table FilmeAtor (
	personagem varchar(45),
    ganhos decimal(10,2),
    fkFilme int,
    foreign key (fkFilme) references Filmes(idFilme),
    fkAtor int,
    foreign key (fkAtor) references Ator(idAtor),
    primary key(fkFilme, fkAtor)
);

-- 2. Insira dados nas tabelas, de forma que tenha um diretor que dirigiu mais de um filme, e tenha pelo menos um filme com mais de um ator.
insert into Filmes values
	(null, 'Kill Bill vol. 1', 'ação',1),
    (null, 'Pulp Fiction', 'ação', 1),
    (null, 'BeetleJuice', 'comédia', 2),
    (null, 'O Hobbit', 'ficção', 3),
    (null, 'A Noiva Cadáver', 'animação', 2),
    (null, 'Senhor dos Anéis', 'ficção', 3);

insert into Diretor values
	(null, 'Quentin Tarantino', 'Estados Unidos', '1963-03-27'),
    (null, 'Tim Burton', 'Estados Unidos', '1958-08-25'),
    (null, 'Peter Jackson', 'Nova Zelândia', '1961-10-31');
   
insert into Ator values
	(null, 'Uma Thurman'),
    (null, 'Helena Bonham Carter'),
    (null, 'Winona Ryder'),
    (null, 'Ian McKellen'),
    (null, 'Alec Baldwin');

insert into FilmeAtor values
	('Black Mamba', '180000.00', 1000, 100),
    ('Mia Wallace', '130000.00', 1001, 100),
    ('Gandalf', '200000.00', 1003, 103),
    ('Gandalf', 300000.00, 1005, 103),
    ('Bride', '250000.00', 1004, 101),
    ('Lydia Deetz', 150000.00, 1002, 102),
    ('Adam Maitland', 150000.00, 1002, 104);
    
-- 4. Exibir todos os dados de cada tabela criada, separadamente.
select * from Filmes;
select * from Diretor;
select * from FilmeAtor;

-- 5. Exibir os dados dos diretores e os dados dos seus filmes.
select * from Diretor, Filmes where idDiretor = fkDiretor;

-- 6. Exibir os dados de um determinado diretor e os dados dos seus filmes.
select * from Diretor, Filmes where idDiretor = fkDiretor 
							and	nomeDiretor = 'Peter Jackson';
                            
-- 7. Exibir a média e a soma dos valores pagos aos atores, no geral.            
select avg(ganhos) as 'Média Salários', sum(ganhos) as 'Soma Salários' from FilmeAtor; 

-- 8. Exibir o menor valor e o maior valor que foi pago aos atores, no geral.
select min(ganhos) as 'Menor Salário', max(ganhos) as 'Maior Salário' from FilmeAtor;

--  9. Exibir os dados dos filmes, os dados dos atores que atuaram, seus papeis e os valores ganhos pelos atores.

select * from Filmes, Ator, FilmeAtor where idFilme = fkFilme and fkAtor = idAtor;

-- 10. Exibir os dados de um determinado filme, os dados dos atores que atuaram, seus papeis e os valores ganhos pelos atores.

select * from Filmes, Ator, FilmeAtor where idFilme = fkFilme 
									and fkAtor = idAtor
                                    and nomeFilme = 'BeetleJuice';
                                    
-- 11. Exibir os dados dos filmes, os dados dos diretores, os dados dos atores que atuaram, seus papeis e os valores ganhos pelos atores.
select * from Filmes, Diretor, Ator, FilmeAtor where fkDiretor = idDiretor
												and fkFilme = idFilme
                                                and fkAtor = idAtor;
                                                
-- 12. Exibir a identificação do filme, a média e a soma dos valores ganhos pelos atores, agrupadas por filme.

select fkFilme as 'idFilme', 
				avg(ganhos) as "Média Valores", 
                sum(ganhos) as 'Soma Valores'
                from FilmeAtor group by fkFilme;
                
-- 13. Exibir a identificação do ator, a média e a soma dos valores ganhos pelos atores, agrupadas por ator

select fkAtor as 'idAtor', 
				avg(ganhos) as 'Média Valores',
                sum(ganhos) as 'Soma Valores'
                from FilmeAtor group by fkAtor;
                
-- 14. Exibir a identificação do filme, o menor e o maior valor ganho pelo ator, agrupado por filme

select fkFilme as 'idFilme',
			min(ganhos) as 'Menor Valor',
            max(ganhos) as 'Maior Valor'
            from FilmeAtor group by fkFilme;
            
-- 15. Exibir a identificação do ator, o menor e o maior valor ganho pelo ator, agrupado por ator.
            
select fkAtor as 'idAtor',
			min(ganhos) as 'Menor Valor',
            max(ganhos) as 'Maior Valor'
            from FilmeAtor group by fkAtor;
            
            