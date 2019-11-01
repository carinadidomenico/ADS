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
    
-- Criar tabela curso
create table Curso (
	idCurso int primary key,
    nomeCurso varchar(10),
    coordenador varchar (40)
);

-- Inserir cados na tabela Curso
insert into Curso values
	(1000, 'ADS', 'Gerson'),
	(1001, 'CCO', 'Marise'),
    (1002,'BD', 'Célia'),
    (1003, 'Redes', 'Leo');
    
-- Exibir dados da tabela Curso
select * from Curso;

-- Acrescentar coluna de chave estrangeira na tabela Aluno (referente à Curso)
alter table Aluno add fkCurso int,
	add foreign key (fkCurso) references Curso (idCurso);

-- Atribuir valores para a coluna fkCurso
update Aluno set fkCurso = 1000 where ra <= 5001;
update Aluno set fkCurso = 1001 where ra = 5002;
update Aluno set fkCurso = 1002 where ra = 5003;

-- Inserir mais um aluno
insert into Aluno values
	(null, 'Luigi', 'Guarapiranga', null);
    
-- Exibir os alunos e os cursos correspondentes
select * from Curso, Aluno where idCurso = fkCurso;

-- Idem ao comando anterior usando JOIN
select * from Aluno join Curso on idCurso = fkCurso;
select * from Aluno inner join Curso on idCurso = fkCurso;

-- Idem comando anterior, mas selecionando todos os alunos, mesmo os sem curso
select * from Aluno left join Curso on idCurso = fkCurso;

-- Idem ao comando anterior, mas selecionando todos os cursos, mesmo os sem alunos
select * from Aluno right join Curso on idCurso = fkCurso;

-- Selecionar alunos do curso de ADS (2 maneiras)
select * from Aluno join Curso on idCurso = fkCurso 
								where nomeCurso = "ADS";
select * from Aluno join Curso on idCurso = fkCurso 
								and nomeCurso = "ADS";
                                
-- Exibe os dados dos alunos e das suas disciplinas usando JOIN
select * from Aluno join AlunoDisciplina on fkAluno = ra
					join Disciplina on fkDisc = idDisc;

-- Exibir alunos da disciplina Algoritmos
select * from Aluno join AlunoDisciplina on fkAluno = ra
					join Disciplina on fkDisc = idDisc
                    where nomeDisc = 'Algoritmos';
                    
-- Exibir apenas as disciplinas de determinado aluno
select * from Aluno join AlunoDisciplina on fkAluno = ra
					join Disciplina on fkDisc = idDisc
                    where nomeAluno = 'Mario Bros';
-- Tudo o que for escrito depois do comando start transaction pode ser desfeito com o comando rollback
-- Se for manter as mudanças, fechar o start transaction com commit              
start transaction;
delete from Curso where idCurso = 1003;
select * from Curso;
rollback;