create database Restaurante;

use Restaurante;

create table Restaurante (
	idRestaurante int primary key auto_increment,
    nome varchar(40),
    bairro varchar(40),
    especialidade varchar(40)
)auto_increment = 10;

create table Cozinheiro (
	idCozinheiro int primary key auto_increment,
    nome varchar(40),
    telefone char(12),
    dataNasc date,
    fkRestaurante int,
    foreign key (fkRestaurante) references Restaurante(idRestaurante),
    fkOrientador int,
    foreign key (fkOrientador) references Cozinheiro(idCozinheiro)
)auto_increment = 1000;

insert into Restaurante values 
	(null, 'D.O.M', 'Jardins', 'brasileira'),
    (null, 'Ravioli', 'Pinheiros', 'italiana'),
    (null, 'Johnny Rockets', 'Centro', 'americana'),
    (null, 'Jin Jin', 'Bela Vista', 'japonesa'),
    (null, 'Pizza Hut', 'Morumbi', 'pizzaria');

insert into Cozinheiro values 
	(null, 'Alex Atala', '0119302-4569', '1962-08-11', 10, null),
    (null, 'Roberto Ravioli', '0119864-6769', '1968-05-21', 11, null ),
	(null, 'Helena Rizzo', '0119302-4769', '1972-09-07', 12, null),
	(null, 'Joana Pires', '0119602-4669', '1952-01-02', 10, 1000),
    (null, 'Rodrigo Rodrigues', '0119962-4265', '1982-11-11', 11, 1001),
    (null, 'Alan Souza', '0119802-3569', '1992-03-10', 12, 1002),
    (null, 'Roberto Pera', '0117802-4577', '1978-12-22', 12, 1002),
	(null, 'Carina Di Domenico', '0119702-8569', '1996-01-31', 10, 1000);

select * from Restaurante;
select * from Cozinheiro;

select * from Restaurante, Cozinheiro where Restaurante.nome = "D.O.M" 
									  and Restaurante.idRestaurante = Cozinheiro.fkRestaurante;
                                      
select * from Cozinheiro as novato, Cozinheiro as experiente
								   where novato.fkOrientador = experiente.idCozinheiro;
                                   
select * from Cozinheiro as novato, Cozinheiro as experiente
								   where novato.fkOrientador = experiente.idCozinheiro
								   and experiente.nome = 'Helena Rizzo';
                                   
select * from Cozinheiro as novato, Cozinheiro as experiente, Restaurante as r
								   where novato.fkOrientador = experiente.idCozinheiro
								   and novato.fkRestaurante = r.idRestaurante
                                   and novato.nome = 'Carina Di Domenico';
                                   
select * from Cozinheiro as novato, Restaurante as r, Cozinheiro as experiente
								   where novato.fkOrientador = experiente.idCozinheiro
								   and novato.fkRestaurante = r.idRestaurante;
