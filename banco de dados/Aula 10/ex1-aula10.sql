create database PraticaJogador;
use PraticaJogador;

-- Criar tabela TimeF
create table TimeF (
	idTime int primary key auto_increment,
    nome varchar(40),
    nomeTecnico varchar(40),
    dataFormacao date 
);

-- Criar tabela Jogador
create table Jogador (
	idJogador int primary key,
    nome varchar(40),
    posicao varchar(30),
    telefone char(12),
    fkTimeF int,
    foreign key (fkTimeF) references TimeF(idTime),
    fkConselheiro int,
    foreign key (fkConselheiro) references Jogador(idJogador)
);

-- Inserir valores na tabela TimeF
insert into TimeF values
	(1, "XV de Piracibaba", "Tarcísio Pugliese", "1913-11-15"),
    (2, "Palmeiras", "Mano Menezes", "1914-08-26"),
    (3, "Santos", "Jorge Sampaoli", "1912-04-14");
    
-- Inserir dados na tabela Jogador
insert into Jogador values 
	(100, "Dudu", "atacante", "123456-89123", 2, null),
    (101, "Lucas", "atacante", "123456-45434", 3, null),
    (102, "Jorginho", "goleiro", "12345-678901",3, 101),
    (103, "Tico", "goleiro", "23456-891234", 1, null),
    (104, "Teco", "zagueiro", "123456-89124", 1, 103),
    (105, "Toco", "meio-campo", "123456-89124", 1, 103);
    
-- Exibir dados separadamente
select * from Jogador;
select * from TimeF;

-- Exibir os dados das duas tabelas
select * from TimeF, Jogador where Timef.idTime = Jogador.fkTimeF;

-- Exibir os nomes dos times e dos técnicos de todos os times cujo nome começa com uma determinada letra
select nome,nomeTecnico from TimeF where nome like "P%";

-- Exibir todos os dados dos jogadores em ordem descrescente pela posição
select * from Jogador order by posicao desc;

-- Exibir os dados dos jogadores que jogam em determinada posição
select * from Jogador where posicao = "atacante";

-- Exibir os dados dos times em que o técnico tenha a segunda letra de trás pra frente igual a uma determinada letra
select * from TimeF where nomeTecnico like "%e__";

-- Exibir os dados em ordem crescente pelo nome do técnico
select * from TimeF order by nomeTecnico;

-- Alterar a posição de algum jogador
update Jogador set posicao = "zagueiro" where idJogador = 105;

-- Exibir os dados dos times e dos seus respectivos jogadores
select * from TimeF, Jogador where TimeF.idTime = Jogador.fkTimeF;