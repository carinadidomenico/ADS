create database Projeto;
use Projeto;

-- Criar tabela projeto
create table Projeto (
	idProjeto int primary key,
    nome varchar(40),
    descProjeto varchar(50)
);

-- Criar tabela Aluno com chave estrangeira fkProjeto e fkRepresentante
-- fkRepresentante como relacionamento recursivo(autorelacionamento)
create table Aluno (
	ra int primary key,
    nome varchar(40),
    telefone char(13),
    fkProjeto int,
    foreign key (fkProjeto) references Projeto(idProjeto),
    fkRepresentante int,
    foreign key (fkRepresentante) references Aluno(ra)
);

-- Criar entidade fraca Acompanhante com a chave primária idAcompanhante ligada na tabela aluno (fkAluno)
-- Se a chave primária for criada, a entidade passa a ser forte
create table Acompanhante (
	idAcompanhante int,
    nome varchar(40),
    relacao varchar(20),
    fkAluno int,
    foreign key (fkAluno) references Aluno(ra),
    primary key (idAcompanhante, fkAluno)
);

-- Inserir dados dos projetos
insert into Projeto values
	(1,"Projeto 1", "Descrição do projeto 1"),
    (2,"Projeto 2", "Descrição do projeto 2"),
    (3,"Projeto 3", "Descrição do projeto 3"),
    (4,"Projeto 4", "Descrição do projeto 4");
    
select * from Projeto;
select * from Aluno;
select* from Acompanhante;

-- Inserir dados dos alunos
insert into Aluno values
	(1234, "Amelia", "0119877-6453", 1, null),
	(5678, "Paulo", "011984-6353", 2, 1234),
    (9101, "Joana", "011934-6283", 4, 1234);
    
-- Inserir dados dos acompanhantes
-- ERRADO
insert into Acompanhante values
	(1, "José","irmão", 9101),
    (1, "Ana Maria","mãe", 9101),
    (2, "Cláudia","mãe", 5678);
    
select * from Aluno, Projeto where fkProjeto = idProjeto;
select * from Aluno, Acompanhante where fkAluno = ra;
    
    