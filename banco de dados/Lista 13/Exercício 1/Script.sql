create database GF;
use GF;

create table Aluno (
	ra int primary key,
    nomeAluno varchar(45),
    email varchar(45)
);

insert into Aluno values 
	(01192091, 'Carina Di Domenico', 'carina@bandtec.com.br'),
    (01192843, 'Raphael Bachega', 'raphael@bandtec.com.br'),
    (01192345, 'Bruna Oliveira', 'bruna@bandtec.com.br'),
    (01192022, 'Caio Cesar', 'caio@bandtec.com.br'),
    (01192523, 'Gabriel Vieira', 'gabriel@bandtec.com.br'),
    (01192765, 'Pedro Lucas', 'pedro@bandtec.com.br'),
    (0119348, 'Brian Braga', 'brian@bandtec.com.br'),
    (01192212, 'João Pedro', 'joao@bandtec.com.br');
    
select * from Aluno;

create table Grupos(
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(30),
    descricao varchar(50)
);

insert into Grupos values 
	(null, "Plant.ai", "vasos com controle de temperatura e umidade"),
    (null, "Reptec", "controle de temperatura e umidade para aquários"),
    (null, "Easy Park", "monitoramento de vagas de estacionamento"),
    (null, "Luxus", "controle de ar condicionado"),
    (null, "Sparkling Labs", "lâmpadas inteligentes");

select * from Grupos;

create table Professor (
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(45),
    disciplina varchar(45)
)auto_increment = 10000;

insert into Professor values 
	(null, "Célia", "Banco de dados"),
    (null, "Brandão", "Pesquisa e Inovação"),
    (null, "Yoshi", "Algoritmos"),
    (null, "Marise", "Arquitetura Computacional"),
    (null, "Leonardo", "Tecnologia da Informação");

select * from Professor;

alter table Aluno add fkGrupo int,
	add foreign key (fkGrupo) references Grupos (idGrupo);
    
update Aluno set fkGrupo = 1 where ra = 01192091;
update Aluno set fkGrupo = 1 where ra = 01192843;
update Aluno set fkGrupo = 1 where ra = 01192022;
update Aluno set fkGrupo = 4 where ra = 01192523;
update Aluno set fkGrupo = 5 where ra = 01192345;
update Aluno set fkGrupo = 5 where ra = 01192212;
update Aluno set fkGrupo = 3 where ra = 0119348;
update Aluno set fkGrupo = 3 where ra = 01192765;

select * from Grupos, Aluno where idGrupo = fkGrupo;

create table Avaliacao (
	nota decimal(4,2),
    dataAval datetime,
    fkProfessor int,
    foreign key (fkProfessor) references Professor(idProfessor),
    fkGrupo int,
    foreign key (fkGrupo) references Grupos(idGrupo),
    primary key(fkGrupo, fkProfessor)
);

select * from Avaliacao;
desc Avaliacao;
insert into Avaliacao values
	(9.5, "2019-11-25 14:00:00", 10000, 1),
    (9.5, "2019-11-25 14:00:00", 10001, 1),
    (9.0, "2019-11-25 14:00:00", 10002, 1),
    (8.5, "2019-11-25 14:00:00", 10003, 1),
    (9.0, "2019-11-25 14:00:00", 10004, 1),
    (7.5, "2019-11-25 14:00:00", 10000, 2),
    (8.5, "2019-11-25 15:00:00", 10001, 2),
    (8.5, "2019-11-25 15:00:00", 10002, 2),
    (8.5, "2019-11-25 15:00:00", 10003, 2),
    (8.5, "2019-11-25 15:00:00", 10004, 2),
    (8.5, "2019-11-25 15:00:00", 10001, 3),
    (8.5, "2019-11-25 16:00:00", 10003, 4),
    (8.5, "2019-11-25 17:00:00", 10000, 5);
    
select * from Avaliacao;
select sum(nota) as "Soma das notas" from Avaliacao;
select distinct nota from Avaliacao;

select * from Professor join Avaliacao on idProfessor = fkProfessor
					join Grupos on idGrupo = fkGrupo;
                    
select * from Professor join Avaliacao on idProfessor = fkProfessor
					join Grupos on idGrupo = fkGrupo
                    where nomeProfessor = "Brandão";
                    
select * from Professor join Avaliacao on idProfessor = fkProfessor
					join Grupos on idGrupo = fkGrupo
                    join Aluno on idGrupo = fkAluno;