create database Gastos;
use Gastos;
create table Pessoas (
	idPessoa int primary key,
    nome varchar (40),
    dataNasc date,
    profissao varchar (30)
);
insert into Pessoas values 
	(1,'Carina', '1996-01-31', 'desenvolvedora front end'),
    (2,'Carla', '1961-11-17', 'mãe'),
    (3, 'Mauricio', '1993-11-11', 'músico'),
    (4, 'Tigresa', '2003-09-13', 'gata mais velha'),
    (5, 'Nina', '2010-10-21', 'gata do meio'),
    (6, 'Rabicho', '2018-09-16', 'gato mais novo');
select * from Pessoas;
create table Gastos (
	idGasto int primary key,
    dataGasto date,
    valor decimal(8,2),
    descricao varchar(60)
);
insert into Gastos values
	(1, '2019-09-20', 2.58, "2 bolachas oreo"),
    (2, '2019-09-18', 30.00, 'Bilhete único'),
    (3, '2019-09-19', 14.80, 'Batata palha'),
    (4, '2019-09-13', 50.52, 'Conta de água');
select * from Gastos;
select * from Pessoas where profissao like "gat%";
select * from Gastos where valor = 30.00;
alter table Pessoas drop foreign key Pessoas_ibfk_1;
alter table Pessoas drop fkGasto;
alter table Gastos add fkPessoa int,
	add foreign key(fkPessoa) references Pessoas(idPessoa);
update Gastos set fkPessoa = 1 where idGasto = 1;
update Gastos set fkPessoa = 1 where idGasto = 2;
update Gastos set fkPessoa = 3 where idGasto = 3;
select * from Pessoas, Gastos where fkPessoa = idPessoa;
update Gastos set fkPessoa = 2 where idGasto = 4;
update Gastos