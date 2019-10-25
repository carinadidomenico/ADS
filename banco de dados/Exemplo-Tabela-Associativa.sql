create database AlunoDisciplina;
use AlunoDisciplina;

create table Aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    bairro varchar(45)
) auto_increment= 5000;

create table Disciplina (
	idDisciplina int primary key auto_increment,
    nomeDisciplina varchar(45)
) auto_increment= 100;

insert into Aluno values
	(null, 'Maria Oliveira', 'Paraíso'),
    (null, 'José da Silva', 'Itaquera'),
    (null, 'Claudia Silva', 'Jabaquara'),
    (null, 'Mario Bros', 'São Mateus');

select * from Aluno;

insert into Disciplina values
	(null, 'Algoritmos'),
    (null, 'Banco de Dados'),
    (null, 'Arquitetura Computacional'),
    (null, 'TI'),
    (null, 'Pesquisa e Inovação');

select * from Disciplina;
create table AlunoDisciplina (
	fkAluno int,
    foreign key (fkAluno) references Aluno(ra),
    fkDisciplina int,
    foreign key (fkDisciplina) references Disciplina(idDisciplina),
    periodoLetivo int,
    primary key (fkAluno, fkDisciplina, periodoLetivo),
    media decimal(4,2),
    qtdFaltas int
);

insert into AlunoDisciplina values 
	(5000, 100, 20192, 8, 3),
    (5000, 101, 20192, 10, 0),
    (5000, 102,20192, 7, 7),
    (5001, 100, 20192, 7, 2),
    (5001, 101, 20192, 6.5, 4),
    (5002, 103, 20192, 8.5, 3),
    (5002, 104, 20192, 9, 1),
    (5003, 104, 20192, 7.5, 5);
    
select * from AlunoDisciplina;

-- Exibir os dados dos alunos e das disciplinas correspondentes
select * from Aluno, Disciplina, AlunoDisciplina 
		where fkAluno = ra and fkDisciplina = idDisciplina;
        
-- Exibir os dados dos alunos da disciplina de Algoritmos
select * from Aluno, Disciplina, AlunoDisciplina 
		where fkAluno = ra and fkDisciplina = idDisciplina and nomeDisciplina = "Algoritmos";
        
-- Exibir os dados de um único aluno e suas disciplinas
select * from Aluno, Disciplina, AlunoDisciplina 
		where fkAluno = ra and fkDisciplina = idDisciplina and nomeAluno = "Maria Oliveira";
        
-- Exibir a soma das médias e das faltas
select sum(media), sum(qtdFaltas) from AlunoDisciplina;

select sum(media) as 'Soma das médias',
	   sum(qtdFaltas) as 'Soma das Faltas' from AlunoDisciplina;
       
-- Exibir a média das médias e a média da qtdFaltas
select round((media),2) as "Média das médias", 
	   round(avg(qtdFaltas)) as 'Média das faltas' from AlunoDisciplina;
       
-- Exibir a maior e a menor média da tabela AlunoDisciplina
select max(media) as 'Maior média',
	   min(media) as 'Menor média' from AlunoDisciplina;

-- Exibir a maior e a menor média agrupado por disciplina
select fkDisciplina, 
	max(media) as 'Maior media',
    min(media) as 'Menor media'
    from AlunoDisciplina group by fkDisciplina;
    
-- Exibir as médias da tabela AlunoDisciplina
select media from AlunoDisciplina;

-- Exibir as médias diferentes da tabela AlunoDisciplina (distinct tira as repetições)
select distinct media from AlunoDisciplina;

-- Exibir a quantidade de médias da tabela AlunoDisciplina
	select count(media) as "Qtd de médias" from AlunoDisciplina;
    
-- Exibir a quantidade de médias da tabela AlunoDisciplina
	select count(distinct media) as "Qtd de médias distintas" from AlunoDisciplina;